//
//  ViewController.m
//  hamburgerMenuNoStoryBoard
//
//  Created by Randall Leung on 11/25/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIViewController *currentVC;
@property (strong, nonatomic) UIViewController *burgerVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
}

- (void)createButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(btnTouched) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Burger Menu" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    button.layer.cornerRadius = 5;
    button.frame = CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 100.0, 50.0);
    [self.view addSubview:button];
}

- (void)btnTouched {
    NSLog(@"Clicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [_currentVC release];
    [_burgerVC release];
    
    [super dealloc];
}

@end
