//
//  PostInfoTableViewCell.m
//  NewsTwitter
//
//  Created by Родион Баглай on 13.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "PostInfoTableViewCell.h"

@implementation PostInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)prepareForReuse
{
    _userImage.image = nil;
    _imagePost.image = nil;
    
}

@end
