//
//  DeserializeableDescriptor.m
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "DeserializeableDescriptor.h"

@implementation DeserializeableDescriptor


+(instancetype) descriptorWith:(NSString*) name andClass:(Class) classType
{
    DeserializeableDescriptor *descriptor = [[DeserializeableDescriptor alloc] init];
    
    descriptor->_name = [name copy];
    descriptor->_classtype = classType;
    
    return descriptor;
}

@end
