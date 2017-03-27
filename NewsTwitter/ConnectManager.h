//
//  ConnectManager.h
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Token;

@interface ConnectManager : NSObject

typedef void (^Completion)();


-(instancetype)init;

@property(nonatomic,strong,readonly) Token *token;
@property (nonatomic,copy) Completion completion;


-(void) updateAuthorization;

@end
