//
//  ShowMessageManager.m
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ShowMessageManager.h"
#import "RequestContext.h"
#import "Network.h"
#import "APISettings.h"
#import "Token.h"
#import "ConnectManager.h"
#import "ExtendedEntities.h"
#import "Post.h"
#import "Media.h"
@interface ShowMessageManager()

//@property(nonatomic,strong) NSMutableArray<Post*> *post;
@property(nonatomic,strong) User *user;
//@property(nonatomic,strong) NSArray<RetweetedStatus*> *retweetedStatus;
@property(nonatomic,strong) ExtendedEntities *extendedEntities;
//@property (nonatomic,strong) NSArray<Media*> *media;
@property(nonatomic,copy) NSString *URL;
@property(nonatomic,strong) NSMutableArray<Post*> *postCopy;



@end

@implementation ShowMessageManager

{
    Network *network;
    RequestContext *context;
    NSDictionary *headers;
    NSNumber *tweetId;
    Post *lastPost;
    
}

- (instancetype)init
{
    _postCopy = [[NSMutableArray alloc] init];
    self = [super init];
    return self;
}



-(void) requestPosts
{
    
    network = [[Network alloc] init];
    _URL = [NSString stringWithFormat:@"%@/%@%d%@%@",baseURL,URLposts,countPosts,screenName,_searchUserName];
    
    NSLog(@"%@",_URL);
    
    
    NSString *basicAuthorization = [NSString stringWithFormat:@"Bearer %@",_token.access_token];
    
    headers = @{
                              @"Authorization" : basicAuthorization,
                              @"Accept-Encoding" : @"gzip"
                              
                              };
    
    context = [[RequestContext alloc] initWithUrl:_URL method:@"GET" expectedClass: [Post class] headerFields:headers resultType:ResultTypeArray];
    
    
    
    
    
    
    
    typeof (self) __weak weakSelf = self;
    
    [network requestWithContext:context completion:^(NSError *error, id data) {
        
        
        [weakSelf handleDataPost:data];
        //check for error is not nill
//        if (NO == error )
//        {
//            NSLog(@"Oooooops");
//        }
    }];
}

-(void)updateMessage
{
    [self requestPosts];
    
}

-(void) loadMessage
{
    [self loadMoreTweets];
}

-(void) handleDataPost:(id) data
{
    _post = (NSArray<Post *> *) data;
   
    _media =(NSArray<Media*>*) _extendedEntities.media;
     lastPost = [_post lastObject];
    _user = [_post firstObject].user;
   // _media = [(NSArray<Media*>*) _extendedEntities valueForKey:@"media"];
    //_media = [_post firstObject].entities.media;
    //[_media  firstObject].media_url_https = [_post firstObject].entities.media.media_url_https;
    //_entities.media = [_post firstObject].entities.media;
    
    
    [_postCopy addObjectsFromArray:_post];
    _completion();
}


-(void) loadMoreTweets
{
    
    lastPost = [_postCopy lastObject];
    tweetId = lastPost.id;
    long tw =  [tweetId longValue] - 1 ;
    
    
    _URL = [NSString stringWithFormat:@"%@/%@%d%@%@%@%ld",baseURL,URLposts,countPosts,screenName,_searchUserName,maxID,tw];
    context = [[RequestContext alloc] initWithUrl:_URL method:@"GET" expectedClass: [Post class] headerFields:headers resultType:ResultTypeArray];
    
    [network requestWithContext:context completion:^(NSError *error, id data) {
       
       
        [_postCopy addObjectsFromArray:data];
        
       
        
    }];

    
}


@end
