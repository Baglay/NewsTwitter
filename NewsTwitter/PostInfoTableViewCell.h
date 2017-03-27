//
//  PostInfoTableViewCell.h
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tweetText;

@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (weak, nonatomic) IBOutlet UILabel *retweetUser;

@property (weak, nonatomic) IBOutlet UILabel *retweetCount;

@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;

@property (weak, nonatomic) IBOutlet UILabel *userCreatedTweet;

@property (weak, nonatomic) IBOutlet UIImageView *imagePost;





@end
