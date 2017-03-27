//
//  ResponseParser.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ResponseParser.h"
#import "Deserializeable.h"
#import "ResponseArrayParser.h"
#import "Media.h"
#import "ExtendedEntities.h"
@implementation ResponseParser


- (instancetype)init
{
    self = [super init];
    return self;
}

-(id) parseResponse:(id)json expectedClass:(Class)class
{
    if(nil == json)
    {
        return nil;
    }
    
    id result = [[class alloc] init];

    
    if( NO == [result conformsToProtocol:@protocol(Deserializeable)])
    {
        
        assert( NO );
        return nil;
    }
    
    NSArray<DeserializeableDescriptor *> *properties = [class deserializeableProperties];
   // ResponseArrayParser *arrayParser = [[ResponseArrayParser alloc] init];
    
    if ([json isKindOfClass:[NSDictionary class]])
    {
        [properties enumerateObjectsUsingBlock:^(DeserializeableDescriptor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             NSString *propertyKey = obj.name;
             id value =  json[propertyKey];
             
             if( [value isKindOfClass:[NSDictionary class]] )
             {
                 id res = [self parseResponse:value expectedClass:obj.classtype];
                 [result setValue:res forKey:propertyKey];
             }
             else if( [value isKindOfClass:[NSArray class]] )
             {
                 NSArray *array = value;
                 if( array.count > 0 )
                 {
                    
                     id res = [self parseResponse:array.firstObject expectedClass:obj.classtype];
                     [result setValue:res forKey:propertyKey];
                 }
             }
             else
             {
                 [result setValue:value forKey:propertyKey];
             }
             
            
            /* if (obj.classtype == [NSNumber class] || obj.classtype == [NSString class] )
             {
                 [result setValue:value forKey:propertyKey];
             }
             else if (obj.classtype == [NSArray class])
            
             {
                 NSArray *array = value;
                 if( array.count > 0 )
                 {
                     id res = [self parseResponse:array.lastObject expectedClass:obj.classtype];
                     [result setValue:res forKey:propertyKey];
                 }
                 
                 //[arrayParser parseResponse:value expectedClass:obj.classtype];
                 //[self parseResponse:value expectedClass:obj.classtype];
             }
            else
                //if( obj.classtype == [NSDictionary class])
             {
                 id item = [self parseResponse:value expectedClass:obj.classtype];
                 [result setValue:item forKey:propertyKey];
             }*/
         }];
        
        
    }
    return result;
    
}




@end
