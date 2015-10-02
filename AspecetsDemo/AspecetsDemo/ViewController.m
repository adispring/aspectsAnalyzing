//
//  ViewController.m
//  AspecetsDemo
//
//  Created by wangzengdi on 15/9/12.
//  Copyright (c) 2015年 adispring. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttonClicked
{
    NSLog(@"button Click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
