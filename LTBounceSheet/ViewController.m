//
//  ViewController.m
//  LTBounceSheet
//
//  Created by ltebean on 14-9-3.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "ViewController.h"
#import "LTBounceSheet.h"

#define color [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1]

@interface ViewController ()
@property(nonatomic,strong) LTBounceSheet *sheet;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.sheet = [[LTBounceSheet alloc]initWithHeight:250 bgColor:color];
    
    UIButton * option1 = [self produceButtonWithTitle:@"take photo"];
    option1.frame=CGRectMake(15, 30, 290, 46);
    [self.sheet addView:option1];
    
    UIButton * option2 = [self produceButtonWithTitle:@"choose existing photo"];
    option2.frame=CGRectMake(15, 90, 290, 46);
    [self.sheet addView:option2];
    
    UIButton * cancel = [self produceButtonWithTitle:@"cancel"];
    cancel.frame=CGRectMake(15, 170, 290, 46);
    [self.sheet addView:cancel];

    
    [self.view addSubview:self.sheet];
    
}


-(UIButton *) produceButtonWithTitle:(NSString*) title
{
    UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor= [UIColor whiteColor];
    button.layer.cornerRadius=23;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:16];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    return button;
}


- (IBAction)toggle:(id)sender {
    [self.sheet toggle];
}


@end
