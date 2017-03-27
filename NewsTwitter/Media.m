//
//  Media.m
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Media.h"
#import "DeserializeableDescriptor.h"
@interface Media()

//@property(nonatomic,copy) NSString *media_url_https;

@end

@implementation Media

- (instancetype)init
{
    self = [super init];
    return self;
}


+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(media_url_https)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(url)) andClass:[NSString class]]
     
     ];
    
    
}


@end
