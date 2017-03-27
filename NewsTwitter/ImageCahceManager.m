//
//  ImageCahceManager.m
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ImageCahceManager.h"



@interface ImageCahceManager()

@property (nonatomic,copy) NSMutableDictionary *imageCache;
@end

@implementation ImageCahceManager
{
    NSDictionary *cache;
    UIImage *newImage;
}

-(instancetype)init
{
    self = [super init];
    //  networkImage = [[NetworkImage alloc] init];
    return self;
}

- (void)cachedImageWithString:(NSString *)string  completion: (CompletionImage) completion {
    // first check for a hit in the cache
    _imageCache = [[NSMutableDictionary alloc] init];
    
    UIImage *cachedImage = [_imageCache objectForKey:string];
    if (cachedImage)
    {
        //  return cachedImage;
        completion(cachedImage);
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
                     NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: string]];
            if ( data == nil )
            {
                return;
            }
            
        
                newImage = [[UIImage alloc] initWithData:data];
                [_imageCache setObject:newImage forKey:string];
            dispatch_async(dispatch_get_main_queue(), ^{

                completion(newImage);
            });
            
            
        });
    }
}


@end
