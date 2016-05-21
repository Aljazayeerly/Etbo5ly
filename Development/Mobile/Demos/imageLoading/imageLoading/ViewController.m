//
//  ViewController.m
//  imageLoading
//
//  Created by ITI on 5/3/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
{
    NSArray * urlsImg;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    urlsImg = [[NSArray alloc] initWithObjects:
               @{@"url":@"http://gradle.org/wp-content/uploads/2015/08/IOS.jpg"},
               @{@"url":@"http://storage.googleapis.com/ix_choosemuse/uploads/2016/02/android-logo.png"},
               @{@"url":@"https://g.twimg.com/Twitter_logo_blue.png"},
               @{@"url":@"http://pdnpulse.pdnonline.com/wp-content/uploads/2015/12/instagram-logo.png"}
               , nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [urlsImg count];
}
-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSURL *url= [[urlsImg objectAtIndex:indexPath.row] valueForKey:@"url"];
    [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    return cell;
}
@end
