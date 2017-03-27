//
//  DeserializeableDescriptor.h
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeserializeableDescriptor : NSObject

@property(nonatomic,readonly,copy) NSString *name;
@property(nonatomic,strong,readonly) Class classtype;
@property (nonatomic,readonly,copy) NSString *keyJson;


+(instancetype) descriptorWith:(NSString*) name andClass:(Class) classType;

@end
