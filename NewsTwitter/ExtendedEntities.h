//
//  ExtendedEntities.h
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Media.h"
#import "Deserializeable.h"
@interface ExtendedEntities : NSObject<Deserializeable>

@property (nonatomic,strong) Media *media;

- (instancetype)init;

@end
