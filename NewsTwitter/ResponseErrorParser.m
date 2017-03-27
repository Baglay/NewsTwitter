//
//  ResponseErrorParser.m
//  NewsTwitter
//
//  Created by Родион Баглай on 24.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ResponseErrorParser.h"
#import "ResponseParser.h"
#import "ResponseArrayParser.h"
#import "DeserializeableDescriptor.h"
#import "Deserializeable.h"
@implementation ResponseErrorParser


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
    ResponseArrayParser *arrayParser = [[ResponseArrayParser alloc] init];
    
    //NSError *anyError;
    //    BOOL success = [receivedData writeToURL:someLocalFileURL
    //                                    options:0
    //                                      error:&anyError];
    //    if (!success) {
    //        NSLog(@"Write failed with error: %@", anyError);
    //        // present error to user
    //    }
    
    for (id object in json) {
        
//        if(json !=  [Post class]  )
//        {
//            anyError = [[NSError alloc] init];
//            NSInteger codeError =  anyError.code;
//            assert(NO);
//        }
//        
        
        id item = [[class alloc] init];
        
        
        [properties enumerateObjectsUsingBlock:^(DeserializeableDescriptor *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             NSString *propertyKey = obj.name;
             
             id value =  object[propertyKey];
             
             //if(nil == value)
             // {
             if (obj.classtype == [NSNumber class] || obj.classtype == [NSString class]  )
             {
                 
                 [item setValue:value forKey:propertyKey];
             }
             else if (obj.classtype == [NSArray class] )
                 //value isKindOfClass:[NSArray class]] )
             {
                 // [self parseResponse:value expectedClass:obj.classtype];
                 [arrayParser parseResponse:value expectedClass:obj.classtype];
             }
             else
                 //if( obj.classtype == [NSDictionary class])
                 //if ( [value isKindOfClass:[NSDictionary class]])
             {
                 id result = [parser parseResponse:value expectedClass:obj.classtype];
                 [item setValue:result forKey:propertyKey];
             }
             //   }
         }];
        
        
        
        [resultArray addObject:item];
        
    }
    
    
    
    return [resultArray copy];
}


@end
