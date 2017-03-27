//
//  Network.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Network.h"
#import "RequestContext.h"
#import "ResponseParser.h"
#import "ResponseArrayParser.h"
#import "ResponseErrorParser.h"
#import "APISettings.h"

@interface Network() <NSURLSessionDelegate>


@end

@implementation Network


{
    NSURLSession *session;
    Class expectedClass;
    
    
}

-(instancetype)init
{
    self = [super init];
    _responseParser = [[ResponseParser alloc] init];
    return self;
}



-(void)prepareParseForType:(ResultType) resultType
{
    switch (resultType) {
        case ResultTypeObject:
            _responseParser = [[ResponseParser alloc] init];
            break;
            
        case ResultTypeArray:
            _responseParser = [[ResponseArrayParser alloc] init];
            break;
            
           case ResultTypeUndefined:
            
           _responseParser = [[ResponseErrorParser alloc] init];
            
        default:
            assert(NO);
            break;
    }
    
}



-(void) requestWithContext: (RequestContext *) context completion: (NetworkHandler) completion
{
    
    [self prepareParseForType: context.resultTypeObject];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    session =  [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    expectedClass = context.expectedClass;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString: context.url];
    request.HTTPMethod = context.httpMethod;
    request.allHTTPHeaderFields = context.headerFields;
    request.HTTPBody = context.body;
   
    typeof (self) __weak weakSelf = self;
    NSURLSessionDataTask *task ;
    task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if( nil != error)
        {
            completion(error,nil);
            return ;
        }
        
        [weakSelf parseData:data completion:completion];
       // NSLog(@"*************\n%@",response);
        
    }];
    [task resume];
}

-(void) parseData:(NSData *) data completion:(NetworkHandler) completion
{
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

  
    if( nil != error)
    {
        completion(error,nil);
        return;
    }
    completion(nil,[_responseParser parseResponse:json expectedClass:expectedClass]);
}


@end
