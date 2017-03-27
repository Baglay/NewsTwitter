//
//  Token.m
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "Token.h"
#import "DeserializeableDescriptor.h"
@implementation Token



- (instancetype)init
{
    self = [super init];
    
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"(access_token : %@ token-type : %@)",_access_token,_token_type];
}

+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(access_token)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:   NSStringFromSelector(@selector(token_type)) andClass:[NSString class]],

     
  
     
    ];
}

@end
