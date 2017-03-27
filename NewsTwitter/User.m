//
//  User.m
//  NewsTwitter
//
//  Created by Родион Баглай on 14.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "User.h"
#import "DeserializeableDescriptor.h"
@interface User()

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *screen_name;
@property(nonatomic,copy) NSString *location;
@property(nonatomic,copy) NSString *id_str;
@property(nonatomic,copy) NSString *profile_image_url_https;

@end

@implementation User

- (instancetype)init
{
    self = [super init];
    
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"(name : %@ screen_name: %@ location: %@ id_str: %@ )",_name,_screen_name,_location,_id_str];
}

+(NSArray <NSString *> *) deserializeableProperties
{
    return @
    [
     
     
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(name)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(screen_name)) andClass:[NSString class]],
   //  [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(description)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(location)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(id_str)) andClass:[NSString class]],
     [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(profile_image_url_https)) andClass:[NSString class]],
      [DeserializeableDescriptor descriptorWith:NSStringFromSelector(@selector(favourites_count)) andClass:[NSNumber class]]
     
     
     
    // NSStringFromSelector(@selector(description)),
     
     ];
    
    
}

-(NSString *)screen_name
{
    NSString *screen_name = [NSString stringWithFormat:@"@%@",_screen_name];
    return screen_name;
}

@end
