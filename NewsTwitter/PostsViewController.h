//
//  PostsViewController.h
//  NewsTwitter
//
//  Created by Родион Баглай on 14.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivityIndicator;

@property (weak, nonatomic) IBOutlet UITableView *postTableView;

@property(nonatomic,copy) NSString *searchUserName;

@property (weak, nonatomic) IBOutlet UIRefreshControl *refreshActivityIndicator;








@end
