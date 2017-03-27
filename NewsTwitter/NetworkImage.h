//
//  NetworkImage.h
//  NewsTwitter
//
//  Created by Родион Баглай on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkImage : NSObject

typedef void (^HandleDataImage)(NSData *dataImage);

@property (nonatomic,copy) HandleDataImage completion;

@property (nonatomic,copy) NSDictionary* cacheImage;

-(instancetype) init;
-(void) downloadWithImage:(NSString*) stringImage completion: (HandleDataImage) completion;

@end
