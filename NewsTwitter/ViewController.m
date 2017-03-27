//
//  ViewController.m
//  NewsTwitter
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ViewController.h"
#import "PostsViewController.h"


@interface ViewController ()

@end

@implementation ViewController 


- (void)viewDidLoad {
    [super viewDidLoad];
   // [self searchUserForName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"searchUser"])
    {
        
        
        
               PostsViewController *vc = [segue destinationViewController];
               vc.searchUserName = _searchUser.text;
        
    }
}






@end
