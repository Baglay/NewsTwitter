//
//  APISettings.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString const  *baseURL = @"https://api.twitter.com";
static NSString const  *consumerKey = @"AvAAMyLOJiwBtjJHXa20VA5Mw";
static NSString const  *secretKey = @"ErlBEVU0lMRMQI4tSJbMYOMbyYdFPsyl57OHY3CHMUrdkxgzU9";
static NSString const  *paramettersConnect = @"oauth2/token";
static int      const  countPosts = 10;
static NSString const *URLposts = @"/1.1/statuses/user_timeline.json?count=";
static NSString const *screenName = @"&screen_name=";
static NSString const *maxID = @"&max_id=";
static NSString const *paramettersPosts = @"/1.1/statuses/user_timeline.json?count=100&screen_name=";
static NSString const  *methodPost = @"POST";
static NSString const  *methodGet = @"GET";
static NSString const   *contentType =@"Content-Type : application/x-www-form-urlencoded;charset=UTF-8";

