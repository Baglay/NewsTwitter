//
//  Post.h
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import "User.h"
#import "RetweetedStatus.h"
#import "ExtendedEntities.h"
@interface Post : NSObject<Deserializeable>


@property(nonatomic,readonly,copy) NSString *text;
@property(nonatomic,readonly,copy) NSString *created_at;
@property(nonatomic,readonly,copy) NSNumber *id;
@property (nonatomic,strong) User *user;
@property (nonatomic,strong) RetweetedStatus *retweeted_status;
@property (nonatomic,strong) ExtendedEntities *extended_entities;
@property(nonatomic,readonly,assign) NSNumber *retweet_count;
@property(nonatomic,readonly,assign) NSNumber *favorite_count;

-(instancetype) init;
-(NSString*) userName;
@end
