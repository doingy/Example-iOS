//
//  WeakProxy.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/14.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class WeakProxy: NSObject {
    weak var target: AnyObject?
    
    init(target: AnyObject) {
        self.target = target
        super.init()
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        return self.target?.responds(to: aSelector) ?? false
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return target
    }
    
    deinit {
        print("WeakProxy deinit")
    }
}
