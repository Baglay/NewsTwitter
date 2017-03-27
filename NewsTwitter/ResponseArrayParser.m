//
//  ResponseArrayParser.m
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ResponseArrayParser.h"
#import "ResponseErrorParser.h"
#import "Deserializeable.h"
#import "User.h"
#import "Post.h"
#import "ResponseParser.h"
#import "RetweetedStatus.h"
#import "DeserializeableDescriptor.h"
#import "ExtendedEntities.h"
@implementation ResponseArrayParser


- (instancetype)init
{
    self = [super init];
    return self;
}

-(id)parseResponse:(id)json expectedClass:(Class)class
{
    
    if(nil == json)
    {
        return nil;
    }
    
    
    NSArray<DeserializeableDescriptor *> *properties = [class deserializeableProperties];
    NSMutableArray<Class> *resultArray = [[NSMutableArray alloc] init];
    
    ResponseParser *parser = [[ResponseParser alloc] init];
    
    for (NSDictionary *object in json) {
        
        id item = [[class alloc] init];
        
        
        [properties enumerateObjectsUsingBlock:^(DeserializeableDescriptor *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             NSString *propertyKey = obj.name;
             
             id value =  object[propertyKey];
             
             if( [value isKindOfClass:[NSDictionary class]] )
             {
                 id res = [parser parseResponse:value expectedClass:obj.classtype];
                 [item setValue:res forKey:propertyKey];
             }
             else
             {
                 [item setValue:value forKey:propertyKey];
             }
             
         }];
        
        
        
        [resultArray addObject:item];
        
    }
    
    
    
    return [resultArray copy];
}

@end
