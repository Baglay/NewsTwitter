//
//  RequestContext.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "RequestContext.h"

@implementation RequestContext



-(instancetype) initWithUrl:(NSString*) url method: (NSString*) method expectedClass:(Class) class headerFields:(NSDictionary*) headerFields body: (NSData*) body resultType:(ResultType)resultType
{
    self = [super init];
    _url = [url copy];
    _httpMethod = [method copy];
    _expectedClass = class;
    _headerFields = [headerFields copy];
    _body = [body copy];
    _resultTypeObject = resultType;
  
    
    return self;
}

-(instancetype) initWithUrl:(NSString*) url method: (NSString*) method expectedClass:(Class) class headerFields:(NSDictionary*) headerFields resultType:(ResultType) resultType
{
    self = [super init];
    _url = [url copy];
    _httpMethod = [method copy];
    _expectedClass = class;
    _headerFields = [headerFields copy];
    _resultTypeObject = resultType;
    
    return self;
}



@end
