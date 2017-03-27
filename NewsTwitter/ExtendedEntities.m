//
//  ExtendedEntities.m
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ExtendedEntities.h"
#import "DeserializeableDescriptor.h"
@interface ExtendedEntities()

//@property(nonatomic,strong) Media *media;

@end

@implementation ExtendedEntities


- (instancetype)init
{
    self = [super init];
    return self;
}


+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(media)) andClass:[Media class]]
     
    ];
    
    
}


@end
