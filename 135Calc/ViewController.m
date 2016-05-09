//
//  ViewController.m
//  myapp
//
//  Created by Yaroslav Dukal on 02.10.14.
//  Copyright (c) 2014 Yaroslav Dukal. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@end

@implementation ViewController

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)killapp:(UIButton *)sender {
    exit(0);
}

//Creates Ui Alert View with my name
- (IBAction)showalert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" message:@"Designed and coded by \nYaroslav Dukal "  delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
    
    
    
}
@end
