//
//  PostsViewController.m
//  NewsTwitter
//
//  Created by Родион Баглай on 14.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "PostsViewController.h"
#import "PostInfoTableViewCell.h"
#import "ShowMessageManager.h"
#import "Post.h"
#import "ResponseArrayParser.h"
#import "ConnectManager.h"
#import "NetworkImage.h"
#import "ImageCahceManager.h"
#import <UIKit/UIKit.h>

@interface PostsViewController ()

@property (nonatomic,copy) NSMutableArray *tableViewData;
@property (nonatomic,assign) BOOL loadingMoreTableViewData;
@property (nonatomic, assign) BOOL shouldScrollToLastRow;


@end

@implementation PostsViewController

{
    NSString *accessToken;
    ConnectManager *connectManager;
    ShowMessageManager *showMessageManager;
    NetworkImage *networkImage;
    // UIRefreshControl *refreshControl;
    ImageCahceManager *imageCacheManager;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showPosts];
    //_postTableView.estimatedRowHeight = 170.0;
     //_postTableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}





#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [showMessageManager.postCopy count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifer = @"cell";
    PostInfoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    //    if (cell == nil) {
    //        cell = [[PostInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    //}
    
    
    
    
    if( showMessageManager.postCopy[indexPath.row].retweeted_status != nil )
    {
        NSString *retweetText = [NSString stringWithFormat:@"%@ ретвитнул(а)",showMessageManager.user.name];
        NSLog(@"%@",showMessageManager.user);
        cell.retweetUser.text =retweetText;
        cell.tweetText.text = showMessageManager.postCopy[indexPath.row].retweeted_status.text;
        cell.nickName.text = showMessageManager.postCopy[indexPath.row].retweeted_status.user.screen_name;
        cell.userName.text = showMessageManager.postCopy[indexPath.row].retweeted_status.user.name;
        [imageCacheManager cachedImageWithString:showMessageManager.postCopy[indexPath.row].retweeted_status.user.profile_image_url_https completion:^(UIImage *dataImage) {
            cell.userImage.image = dataImage;
        }];
        
        [imageCacheManager cachedImageWithString:showMessageManager.postCopy[indexPath.row].retweeted_status.extended_entities.media.media_url_https completion:^(UIImage *dataImage) {
            cell.imagePost.image = dataImage;
        }];
        
        cell.userCreatedTweet.text = showMessageManager.postCopy[indexPath.row].retweeted_status.created_at;
        cell.retweetCount.text = [NSString stringWithFormat:@"%@",showMessageManager.postCopy[indexPath.row].retweeted_status.retweet_count];
        cell.favoriteCount.text = [NSString stringWithFormat:@"%@",showMessageManager.postCopy[indexPath.row].retweeted_status.favorite_count];
    }
    
    else
    {
        cell.retweetUser.text =@"";
        cell.tweetText.text =showMessageManager.postCopy[indexPath.row].text;
        cell.nickName.text = showMessageManager.user.screen_name;
        cell.userName.text = showMessageManager.user.name;
        [imageCacheManager cachedImageWithString:showMessageManager.user.profile_image_url_https completion:^(UIImage *dataImage) {
            cell.userImage.image = dataImage;
        }];
        [imageCacheManager cachedImageWithString:showMessageManager.postCopy[indexPath.row].extended_entities.media.media_url_https completion:^(UIImage *dataImage) {
            cell.imagePost.image = dataImage;
        }];
        cell.userCreatedTweet.text = showMessageManager.postCopy[indexPath.row].created_at;
        cell.retweetCount.text = [NSString stringWithFormat:@"%@",showMessageManager.postCopy[indexPath.row].retweet_count];
        cell.favoriteCount.text = [NSString stringWithFormat:@"%@", showMessageManager.postCopy[indexPath.row].favorite_count];
    }
    
    return cell;
}



-(void) showPosts
{
    connectManager = [[ConnectManager alloc] init];
    showMessageManager = [[ShowMessageManager alloc] init];
    showMessageManager.searchUserName = _searchUserName;
    imageCacheManager = [[ImageCahceManager alloc] init];
    networkImage = [[NetworkImage alloc] init];
    typeof (showMessageManager) __weak weakShowMessageManager = showMessageManager;
    typeof (connectManager) __weak weakConnectManagerr = connectManager;
    typeof (self) __weak weakSelf = self;
    
    
    connectManager.completion = ^{
        
        //showMessageManager = [[ShowMessageManager alloc] init];
        weakShowMessageManager.token = weakConnectManagerr.token;
        weakShowMessageManager.completion = ^{
            [weakSelf.loadingActivityIndicator stopAnimating];
            weakSelf.postTableView.hidden = NO;
            [weakSelf.postTableView reloadData];
        };
        [weakShowMessageManager updateMessage];
        [weakShowMessageManager loadMessage];
    };
    [weakConnectManagerr updateAuthorization];
    
    
    
    
}


//-(void)tableView:(UITableView *)tableView willDisplayCell:(PostInfoTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Post *post = showMessageManager.postCopy[indexPath.row];
//
//    if(indexPath.row)
//    {
//        if( nil != post.user.profile_image_url_https )
//        {
//            if( nil != imageCacheManager)
//            {
//                [imageCacheManager cachedImageWithString:post.user.profile_image_url_https completion:^(UIImage *dataImage) {
//                    cell.userImage.image = dataImage;
//                }];
//
//
//            }
//        }
//         if( nil != post.retweeted_status.user.profile_image_url_https )
//        {
//            if( nil != imageCacheManager)
//            {
//                [imageCacheManager cachedImageWithString:post.retweeted_status.user.profile_image_url_https completion:^(UIImage *dataImage) {
//                    cell.userImage.image = dataImage;
//                }];
//
//
//            }
//        }
//
//    }
//}



- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self scrollToBottom];
}




-(void)scrollToBottom
{
    if (_shouldScrollToLastRow)
    {
        CGPoint bottomOffset = CGPointMake(0, _postTableView.contentSize.height-50 - _postTableView.bounds.size.height-50);
        [_postTableView setContentOffset:bottomOffset animated:YES];
        
        
    }
}

-(void)scrollViewDidScroll: (UIScrollView*)scrollView
{
    float scrollViewHeight = scrollView.frame.size.height;
    float scrollContentSizeHeight = scrollView.contentSize.height;
    float scrollOffset = scrollView.contentOffset.y;
    
    // if you're not at bottom then scroll to bottom
    
    if (!(scrollOffset + scrollViewHeight == scrollContentSizeHeight ))
    {
        [self scrollToBottom];
        
    } else
        
    {
        // bottom reached now stop scrolling
        
        _shouldScrollToLastRow = NO;
        [showMessageManager loadMessage];
        [_postTableView reloadData];
        //[_loadingActivityIndicator stopAnimating];
        
        
    }
}



@end
