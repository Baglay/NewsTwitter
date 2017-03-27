//
//  ShowMessageManager.h
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import "Token.h"
@interface ShowMessageManager : NSObject

typedef void (^Completion)();



@property(nonatomic,strong) NSArray<Post*> *post;
@property(nonatomic,strong,readonly) NSMutableArray<Post*> *postCopy;

@property (nonatomic,strong,readonly) NSArray<Media*> *media;
@property (nonatomic,strong,readonly) NSDictionary *mediaUrl;
@property(nonatomic,strong,readonly) User *user;
@property(nonatomic,strong,readonly) ExtendedEntities *entities;
//@property(nonatomic,strong,readonly) NSArray<RetweetedStatus*> *retweetedStatus;
@property(nonatomic,copy) NSString *searchUserName;
@property(nonatomic,strong) Token *token;
@property (nonatomic,copy) Completion completion;





-(instancetype)init;


-(void) updateMessage;

-(void) loadMoreTweets;
-(void) loadMessage;

@end
