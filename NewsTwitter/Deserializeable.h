//
//  Deserializeable.h
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeserializeableDescriptor.h"
@protocol Deserializeable <NSObject>

+(NSArray <DeserializeableDescriptor *> *) deserializeableProperties;


@end
