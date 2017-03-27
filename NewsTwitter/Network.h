//
//  Network.h
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestContext;
@protocol Parser;

typedef void (^NetworkHandler)(NSError *error, id data);

@interface Network : NSObject

@property (nonatomic,strong,readonly) id<Parser> responseParser;
//@property (nonatomic,copy) NSDictionary *accessToken;

-(instancetype) init;
-(void) requestWithContext: (RequestContext *) context completion: (NetworkHandler) completion;



@end
