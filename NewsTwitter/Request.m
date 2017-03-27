//
//  Request.m
//  NewsTwitter
//
//  Created by Родион Баглай on 24.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Request.h"

@implementation Request



- (instancetype)init
{
    self = [super init];
    return self;
}



+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(error)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(request)) andClass:[NSString class]],
     
     ];
}



@end
