//
//  Post.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Post.h"
#import "ConvertDate.h"
#import "DeserializeableDescriptor.h"
@interface Post()

@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *created_at;


@end

@implementation Post
{
    ConvertDate *convertDate;
    
}


- (instancetype)init
{
    self = [super init];
    
    
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"text! : %@ created_at %@ user %@",_text,_created_at,_user];
}



+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(text)) andClass:[NSString class]],
       [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(id)) andClass:[NSNumber class]],
     [DeserializeableDescriptor descriptorWith:  NSStringFromSelector(@selector(created_at)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(user)) andClass:[User class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(retweeted_status)) andClass:[RetweetedStatus class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(retweet_count)) andClass:[NSNumber class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(favorite_count)) andClass:[NSNumber class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(extended_entities)) andClass:[ExtendedEntities class]]
     
     
     ];
}

-(NSString*) userName
{
    return _user.name;
}

-(NSString *)created_at
{
    convertDate = [[ConvertDate alloc] init];
    NSString *convertDateToString = [convertDate retrivePostTime:_created_at];
    return convertDateToString;
}



@end
