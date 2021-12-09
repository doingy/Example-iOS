//
//  QueueViewController.m
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/10/11.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import "QueueViewController.h"

@interface QueueViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation QueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.timer = [NSTimer timerWithTimeInterval:0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@", [NSDate date]);
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
