//
//  Errors.m
//  NewsTwitter
//
//  Created by Родион Баглай on 24.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Errors.h"

@implementation Errors



- (instancetype)init
{
    self = [super init];
    return self;
}



+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(message)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(code)) andClass:[NSNumber class]],
     
     ];
}


@end
