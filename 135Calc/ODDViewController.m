
//
//  ODDViewController.m
//  myapp
//
//  Created by Yaroslav Dukal on 03.10.14.
//  Copyright (c) 2014 Yaroslav Dukal. All rights reserved.
//

#import "ODDViewController.h"
#import <AudioToolbox/AudioToolbox.h> //Imports AudioTools (Framework needs to be added in app bundle

@interface ODDViewController ()

@property (strong, nonatomic) IBOutlet UITextField *oddnum1;
@property (strong, nonatomic) IBOutlet UITextField *oddnum2;
@property (strong, nonatomic) IBOutlet UILabel *oddD;
@property (strong, nonatomic) IBOutlet UILabel *dispmain;
@property (strong, nonatomic) IBOutlet UILabel *numsDisp;

@end

@implementation ODDViewController

- (IBAction)clearbutton:(UIButton *)sender {
    self.oddnum1.text = @"";
    self.oddnum2.text = @"";
    self.oddD.text = @"";
    self.dispmain.text = @"";
    self.numsDisp.text = @"";
    
}

- (IBAction)calc:(UIButton *)sender {
    
    
    if (([self.oddnum1.text length] > 0 || self.oddnum1.text !=nil ==FALSE )
     && ([self.oddnum2.text length] > 0 || self.oddnum2.text !=nil ==FALSE ))
        
    {
    self.dispmain.text = @"Total odd numbers is ";
    [self.oddnum1 resignFirstResponder];
    [self.oddnum2 resignFirstResponder];
    int val1 = [self.oddnum1.text intValue];
    int val2 = [self.oddnum2.text intValue];
    
    
    if (val2 > 1000)
    {
        self.numsDisp.text = @"Please enter a number less or equal 1000 ";
        self.oddD.text = @"";
        self.dispmain.text = @"";
        [self lockAnimationForView: _oddnum2]; //Shakes the num2 textfield
        [self lockAnimationForView: _numsDisp];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  //Vibrates
    }
     if (val1 > 1000)
        {
            [self lockAnimationForView: _oddnum1];
            [self lockAnimationForView: _numsDisp];
            self.numsDisp.text = @"Please enter a number less or equal 1000 ";
            self.oddD.text = @"";
            self.dispmain.text = @"";
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        if (val1 > val2) {
            self.numsDisp.text = @"Please enter lowest number first";
            [self lockAnimationForView: _oddnum1];
            [self lockAnimationForView: _numsDisp];
            self.dispmain.text = @"";
            self.oddD.text = @"";
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            }
    
    else if (val2 <= 1000)
    {
        
    int k = 0;
    NSString *numbers = @"";
    
    for (int i = val1; i <= val2; i++)
     {
          if (i%2 == 1)
          {
             NSString *numeros = [NSString stringWithFormat:@"%i", i];
             numbers = [NSString stringWithFormat: @"%@ %@", numbers, numeros]; //Displays all the numbers
             k++;
         } }
    
        NSString *dip = [NSString stringWithFormat:@"%i", k];  //Converting integer value to a string
        [self.oddD setText:dip];
        [self.numsDisp setText: numbers];    //Display output data
    }
        }

  
}

-(void)lockAnimationForView:(UIView*)view   //Animation shake effect method
{
    CALayer *lbl = [view layer];
    CGPoint posLbl = [lbl position];
    CGPoint y = CGPointMake(posLbl.x-5, posLbl.y);
    CGPoint x = CGPointMake(posLbl.x+10, posLbl.y);
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction
                                  functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    [lbl addAnimation:animation forKey:nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
@end
