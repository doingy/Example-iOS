//
//  RegexViewController.m
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/10/13.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import "RegexViewController.h"

@interface RegexViewController ()

@end

@implementation RegexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 正则分组
    NSString *url = @"https://yach-doc-shimo.zhiyinlou.com/docs/8HCx8QDkkxQ68pRv/  <<160文档链接识别方案>>";
    NSString *patten = @"\\s*(?<url>(?:http|https)://(?:yach-doc-shimo-test.zhiyinlou.com|yach-doc-shimo.zhiyinlou.com)/(?<type>.+?\\s*)/(?<guid>[A-Za-z0-9]{16})/?(?:[A-Za-z0-9]{5})?/?)\\s*(?:<(?<title>.+?)>)?";
    
    NSRegularExpression *ex = [[NSRegularExpression alloc] initWithPattern:patten options:0 error:NULL];
    NSArray<NSTextCheckingResult *> *result = [ex matchesInString:url options:0 range:NSMakeRange(0, url.length)];
    
    NSTextCheckingResult *r = result.firstObject;
//    for (int index = 0; index < r.numberOfRanges; index++) {
//        NSString *s = [url substringWithRange:[r rangeAtIndex:index]];
//        NSLog(@"%@", s);
    NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"url"]]);
    NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"type"]]);
    NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"guid"]]);
    NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"title"]]);
    
    // 
    
    [ex enumerateMatchesInString:url options:0 range:NSMakeRange(0, url.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"url"]]);
        NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"type"]]);
        NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"guid"]]);
        NSLog(@"%@", [url substringWithRange:[r rangeWithName:@"title"]]);
        
        *stop = YES;
    }];
//    }
}

@end
