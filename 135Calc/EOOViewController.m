//
//  EOOViewController.m
//  Interval
//
//  Created by Yaroslav Dukal on 04.10.14.
//  Copyright (c) 2014 Yaroslav Dukal. All rights reserved.
//

#import "EOOViewController.h"
#import <AudioToolbox/AudioToolbox.h>


@interface EOOViewController ()
@property (strong, nonatomic) IBOutlet UITextField *eonum1;
@property (strong, nonatomic) IBOutlet UITextField *eonum2;
@property (strong, nonatomic) IBOutlet UILabel *eoDisplay;
@property (strong, nonatomic) IBOutlet UILabel *textDisp;
@property (strong, nonatomic) IBOutlet UILabel *numsDisp;

@end

@implementation EOOViewController

- (IBAction)clearButton:(UIButton *)sender {
    self.eonum1.text = @"";
    self.eonum2.text = @"";
    self.eoDisplay.text = @"";
    self.textDisp.text = @"";
    self.numsDisp.text = @"";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)calcButton:(UIButton *)sender {
    
    
    
    if (([self.eonum1.text length] > 0 || self.eonum1.text !=nil ==false )
     && ([self.eonum2.text length] > 0 || self.eonum2.text !=nil ==false ))
    
    {
    
    self.textDisp.text = @"Total E.O.O numbers is: ";
    [self.eonum1 resignFirstResponder];
    [self.eonum2 resignFirstResponder];
    int val1 = [self.eonum1.text intValue];
    int val2 = [self.eonum2.text intValue];
        
        if (val2 > 1000)
        {
            self.numsDisp.text = @"Please enter a number less or equal 1000 ";
            self.eoDisplay.text = @"";
            self.textDisp.text = @"";
            [self lockAnimationForView: _eonum2];
            [self lockAnimationForView: _numsDisp];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        if (val1 > 1000)
        {
            [self lockAnimationForView: _eonum1];
            [self lockAnimationForView: _numsDisp];
            self.numsDisp.text = @"Please enter a number less or equal 1000 ";
            self.eoDisplay.text = @"";
            self.textDisp.text = @"";
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        if (val1 > val2) {
            self.numsDisp.text = @"Please enter lowest number first";
            [self lockAnimationForView: _eonum1];
            [self lockAnimationForView: _numsDisp];
            self.textDisp.text = @"";
            self.eoDisplay.text = @"";
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        else if (val2 <= 1000)
        {
    
            int k = 0;
            int lastN =2;
            NSString *numbers = @"";
    
    for (int i = val1; i <= val2; i++)
    {
        if (i%2 ==1)
        {
            if (lastN == 2)
            {
                NSString *numeros = [NSString stringWithFormat:@"%i", i];
                numbers = [NSString stringWithFormat: @"%@ %@", numbers, numeros];
                k++;
                lastN = 0;
            }
                lastN ++;
        } }
            
        NSString *dip = [NSString stringWithFormat:@"%i", k];
        [self.eoDisplay setText:dip];
        [self.numsDisp setText: numbers];
}} }


-(void)lockAnimationForView:(UIView*)view   //Animation shake effects class
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
