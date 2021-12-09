//
//  PropertyViewModel.h
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PropertyViewModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> *immutableArray;
@property (nonatomic, strong) NSMutableArray<NSString *> *mutableArray;

@property (nonatomic, copy) NSArray<NSString *> *copiedImmutableArray;
@property (nonatomic, copy) NSMutableArray<NSString *> *copiedMutableArray;

@property (nonatomic, strong) NSString *immutableString;
@property (nonatomic, strong) NSMutableString *mutableString;

@property (nonatomic, copy) NSString *copiedImmutableString;
@property (nonatomic, copy) NSMutableString *copiedMutableString;

@end

NS_ASSUME_NONNULL_END
