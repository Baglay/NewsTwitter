//
//  RetweetedStatus.h
//  NewsTwitter
//
//  Created by Родион Баглай on 21.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
#import "ExtendedEntities.h"
#import "User.h"
@interface RetweetedStatus :NSObject<Deserializeable>


- (instancetype)init;

@property(nonatomic,copy,readonly) NSString *created_at;
@property(nonatomic,copy,readonly) NSString *id;
@property(nonatomic,copy,readonly) NSString *text;
@property(nonatomic,copy,readonly) NSString *id_str;
@property (nonatomic,strong) User *user;
@property (nonatomic,strong) ExtendedEntities *extended_entities;
//@property(nonatomic,copy,readonly) NSString *profile_image_url_https;
@property(nonatomic,readonly,assign) NSNumber *retweet_count;
@property(nonatomic,readonly,assign) NSNumber *favorite_count;



@end
