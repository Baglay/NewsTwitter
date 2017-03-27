//
//  Media.h
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"

@interface Media : NSObject <Deserializeable>



@property(nonatomic,copy)          NSString *media_url_https;
@property(nonatomic,readonly,copy) NSString *url;

-(instancetype) init;


@end
