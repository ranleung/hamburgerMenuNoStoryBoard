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
@property (strong, nonatomic) UIButton *burgerButton;
@property BOOL isActiveBurger;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _isActiveBurger = false;
    [self createButton];
    [self createBurgerVC];
}

-(void)createBurgerVC {
    _burgerVC = [[[UIViewController alloc] init] autorelease];
    _burgerVC.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:_burgerVC];
    _burgerVC.view.backgroundColor = [UIColor blueColor];
    _burgerVC.view.frame = self.view.frame;
    [self.view insertSubview:_burgerVC.view belowSubview: _burgerButton];
    [self.burgerVC didMoveToParentViewController:self];
}

- (void)createButton {
    _burgerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_burgerButton addTarget:self action:@selector(btnTouched) forControlEvents:UIControlEventTouchUpInside];
    [_burgerButton setTitle:@"Burger Menu" forState:UIControlStateNormal];
    [_burgerButton setBackgroundColor:[UIColor grayColor]];
    _burgerButton.layer.cornerRadius = 5;
    _burgerButton.frame = CGRectMake(0, 65, 100.0, 50.0);
    [self.view addSubview:_burgerButton];
}

- (void)btnTouched {
    NSLog(@"Clicked");
    if (_isActiveBurger == false) {
        [UIView animateWithDuration:0.4 animations:^{
            _burgerVC.view.frame = CGRectMake(self.view.frame.size.width * 0.6, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        _isActiveBurger = true;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            _burgerVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
        _isActiveBurger = false;
    }
}

- (void) dealloc {
    [_currentVC release];
    [_burgerVC release];
    [_burgerButton release];
    [super dealloc];
}

@end
