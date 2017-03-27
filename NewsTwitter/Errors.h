//
//  Errors.h
//  NewsTwitter
//
//  Created by Родион Баглай on 24.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
@interface Errors : NSObject <Deserializeable>

@property(nonatomic,readonly,copy) NSString *message;
@property(nonatomic,readonly,copy) NSNumber *code;

@end
