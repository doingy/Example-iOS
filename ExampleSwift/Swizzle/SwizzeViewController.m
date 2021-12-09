//
//  SwizzeViewController.m
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import "SwizzeViewController.h"
#import "SwizzeViewModel.h"

@interface SwizzeViewController ()

@end

@implementation SwizzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SwizzeViewModel *model = [SwizzeViewModel new];
    [model test];
    
    
}

@end
