//
//  NetworkImage.m
//  NewsTwitter
//
//  Created by Родион Баглай on 20.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "NetworkImage.h"
#import <UIKit/UIKit.h>
@implementation NetworkImage


-(instancetype) init
{
    self = [super init];
    return self;
    
}
-(void) downloadWithImage:(NSString*) stringImage completion: (HandleDataImage) completion
{
    
   
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: stringImage]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data);
            });
            
        });
    
    
}

@end
