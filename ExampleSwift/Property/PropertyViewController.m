//
//  PropertyViewController.m
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import "PropertyViewController.h"
#import "PropertyViewModel.h"

@interface PropertyViewController ()

@end

@implementation PropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray<NSString *> *immutableArray = @[@"hello1", @"world1"];
    NSMutableArray<NSString *> *mutableArray = [NSMutableArray array];
    [mutableArray addObject:@"hello2"];
    [mutableArray addObject:@"world2"];
    
    /*
     1. copy 修饰的 Mutable类型，赋值会变为不可变类型
     2. strong 修饰 NSString, 赋值 NSMutableString，可能会变更
     */
    
    NSString *hello = @"hello";
    NSMutableString *world = [NSMutableString string];
    [world appendString:@"w"];
    [world appendString:@"o"];
    [world appendString:@"r"];
    [world appendString:@"l"];
    [world appendString:@"d"];
    
    NSLog(@"%@, %@, %@, %@", immutableArray, mutableArray, hello, world);
    
    // 正常情况
    PropertyViewModel *viewModel = [[PropertyViewModel alloc] init];
    viewModel.immutableArray = immutableArray;
    viewModel.mutableArray = mutableArray;
    
    viewModel.copiedImmutableArray = immutableArray;
    viewModel.copiedMutableArray = mutableArray;
    
    viewModel.immutableString = hello;
    viewModel.mutableString = world;
    
    viewModel.copiedImmutableString = hello;
    viewModel.copiedMutableString = world;
    
    NSLog(@"%@, %@, %@, %@, \n%@, %@, %@, %@",
          viewModel.immutableArray,
          viewModel.mutableArray,
          viewModel.copiedImmutableArray,
          viewModel.copiedMutableArray,
          viewModel.immutableString,
          viewModel.mutableString,
          viewModel.copiedImmutableString,
          viewModel.copiedMutableString);
    
    immutableArray = @[@"hello"];
    [mutableArray addObject:@"!!!!!"];
    hello = @"hello, world";
    [world appendString:@"!"];
    [world appendString:@"!"];
    [world appendString:@"!"];
    [world appendString:@"!"];
    
    NSLog(@"%@, %@, %@, %@, \n%@, %@, %@, %@",
          viewModel.immutableArray,
          viewModel.mutableArray,
          viewModel.copiedImmutableArray,
          viewModel.copiedMutableArray,
          viewModel.immutableString,
          viewModel.mutableString,
          viewModel.copiedImmutableString,
          viewModel.copiedMutableString);
}

@end
