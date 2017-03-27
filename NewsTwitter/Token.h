//
//  Token.h
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deserializeable.h"
@interface Token : NSObject<Deserializeable>


- (instancetype)init;

@property(nonatomic,copy,readonly) NSString *access_token;
@property (nonatomic,copy,readonly) NSString *token_type;
@end
