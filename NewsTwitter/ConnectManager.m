//
//  ConnectManager.m
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ConnectManager.h"
#import "RequestContext.h"
#import "Network.h"
#import "APISettings.h"
#import "Token.h"
#import "ShowMessageManager.h"
@implementation ConnectManager

{
    Network *network;
    ShowMessageManager *showMessageManager;
    
}

- (instancetype)init
{
    self = [super init];
    return self;
}




-(void) reuqestConnect
{
    
    network = [[Network alloc] init];
    
    NSString *URL = [NSString stringWithFormat:@"%@/%@",baseURL,paramettersConnect];
    NSString *key = [NSString stringWithFormat:@"%@:%@",consumerKey,secretKey];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Key = [keyData base64EncodedStringWithOptions:0];
    NSString *basicAuthorization = [NSString stringWithFormat:@"Basic %@",base64Key];
    NSDictionary *headers = @{
                              @"Authorization" : basicAuthorization,
                              @"Content-Type" : @"application/x-www-form-urlencoded;charset=UTF-8."
                              
                              };
    NSString *body = @"grant_type=client_credentials";
    NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    
 RequestContext *context = [[RequestContext alloc] initWithUrl:URL method:@"POST" expectedClass: [Token class] headerFields:headers body:bodyData resultType:ResultTypeObject] ;
    
    typeof (self) __weak weakSelf = self;
    
    [network requestWithContext:context completion:^(NSError *error, id data) {
        
        //check for error is not nill
//        if(error==nil)
//        {
//            NSLog(@"%@",error.localizedDescription);
//        }
        [weakSelf handleDataConnect:data];
//        NSError *connectError = error;
       // NSLog(@"error %@",error.localizedDescription);
    }];
}


-(void) updateAuthorization
{
   
    [self reuqestConnect];
    // _completion();
    //
}


-(void) handleDataConnect:(id) data
{
    _token = (Token *) data;
     _completion();

}


@end
