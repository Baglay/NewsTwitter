//
//  User.h
//  NewsTwitter
//
//  Created by Родион Баглай on 14.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
@interface User : NSObject<Deserializeable>




@property(nonatomic,copy,readonly) NSString *name;
//@property(nonatomic,copy,readonly) NSString *description;
@property(nonatomic,copy,readonly) NSString *screen_name;
@property(nonatomic,copy,readonly) NSString *location;
@property(nonatomic,copy,readonly) NSString *id_str;
@property(nonatomic,copy,readonly) NSString *profile_image_url_https;
@property(nonatomic,copy,readonly) NSNumber *favourites_count;


- (instancetype)init;

@end
