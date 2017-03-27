//
//  RequestContext.h
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>


//пилим энум
//typedef NS_ENUM(NSUInteger,ResultType);

typedef NS_ENUM(NSInteger,ResultType)
{
    ResultTypeObject = 1,
    ResultTypeArray,
    ResultTypeUndefined = 0
};


@interface RequestContext : NSObject


@property (nonatomic,copy,readonly) NSString *url;
@property (nonatomic,copy,readonly) NSString *httpMethod;
@property (nonatomic,strong,readonly) Class expectedClass;
@property (nonatomic,assign,readonly) ResultType resultTypeObject;
@property (nonatomic, copy) NSDictionary *headerFields;
@property (nonatomic,copy) NSData* body;



-(instancetype) initWithUrl:(NSString*) url method: (NSString*) method expectedClass:(Class) class headerFields:(NSDictionary*) headerFields body: (NSData*) body resultType:(ResultType) resultType;

-(instancetype) initWithUrl:(NSString*) url method: (NSString*) method expectedClass:(Class) class headerFields:(NSDictionary*) headerFields resultType:(ResultType) resultType;

-(instancetype) init NS_UNAVAILABLE;

@end
