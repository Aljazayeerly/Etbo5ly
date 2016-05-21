//
//  NavigationTableViewController.m
//  SlideMenuDemo
//
//  Created by ITI on 5/20/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "NavigationTableViewController.h"
#import "SWRevealViewController.h"
@interface NavigationTableViewController ()
{
    NSArray *menu;
}
@end

@implementation NavigationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    menu=@[@"first",@"second",@"third"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menu.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier=[menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue isKindOfClass:[SWRevealViewControllerSegue class]])
    {
        SWRevealViewControllerSegue *swSegue=(SWRevealViewControllerSegue*) segue;
        swSegue.performBlock=^(SWRevealViewControllerSegue * rvc_segue,UIViewController* svc,UIViewController* dvc)
        {
            UINavigationController *nevController=(UINavigationController*)self.revealViewController.frontViewController;
            [nevController setViewControllers:@[dvc] animated:NO];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated:YES];
        };
        
    }
}

@end
