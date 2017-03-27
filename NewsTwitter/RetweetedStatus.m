//
//  RetweetedStatus.m
//  NewsTwitter
//
//  Created by Родион Баглай on 21.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "RetweetedStatus.h"
#import "ConvertDate.h"
#import "DeserializeableDescriptor.h"


@interface RetweetedStatus()

@property(nonatomic,copy) NSString *created_at;

@end
@implementation RetweetedStatus
{
    ConvertDate *convertDate;
}

- (instancetype)init
{
    self = [super init];
    convertDate = [[ConvertDate alloc] init];
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"(name : %@ screen_name: %@ location: %@ id_str: %@ )",_created_at,_id,_text,_id_str];
}

+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(created_at)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(id)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(text)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(id_str)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(user)) andClass:[User class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(extended_entities)) andClass:[ExtendedEntities class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(retweet_count)) andClass:[NSNumber class]],
     [DeserializeableDescriptor descriptorWith: NSStringFromSelector(@selector(favorite_count)) andClass:[NSNumber class]],
     
     
     
     ];
    
    
}

-(NSString *)created_at
{
    NSString *convertDateToString = [convertDate retrivePostTime:_created_at];
    return convertDateToString;
}



@end
