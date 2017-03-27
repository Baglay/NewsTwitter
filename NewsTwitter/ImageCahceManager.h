//
//  ImageCahceManager.h
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
 
@interface ImageCahceManager : NSObject

//typedef NSCache* (^CompletionCache)();
typedef void (^CompletionImage)(UIImage *dataImage);
//@property (nonatomic,weak) UIImage *image;
//@property (nonatomic,copy) NSURL *urlImage;
@property (nonatomic,copy,readonly) NSMutableDictionary *imageCache;
//@property (nonatomic,copy) CompletionCache sharedCache;



//-(void)loadFromURL:(NSURL*)url;
-(void)cachedImageWithString:(NSString *)string completion: (CompletionImage) completion;


@end
