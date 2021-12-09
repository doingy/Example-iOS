//
//  DNotification.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/13.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import Foundation

class DNotification: NSObject {
    var name: String
    var userInfo: [AnyHashable: Any]
    var object: AnyObject?
    
    init(name: String, userInfo: [AnyHashable: Any], object: AnyObject? = nil) {
        self.name = name
        self.userInfo = userInfo
        self.object = object
    }
}

class DNotificationCenter {
    static let `default` = DNotificationCenter()
    
    var map: [String: [Observer]] = [:]
    
    struct Observer {
        let object: AnyObject
        let selecter: Selector
        let context: AnyObject?
    }
    
    func addObserver(_ observer: AnyObject, selector: Selector, name: String, object: AnyObject? = nil) {
        let observer = Observer(object: observer, selecter: selector, context: object)
        
        var observers = map[name] ?? []
        observers.append(observer)
        map[name] = observers
    }
    
    func removeObserver(_ observer: AnyObject) {
        for (key, value) in map {
            for idx in 0..<value.count {
                let object = value[idx]
                if object.object === observer {
                    
                    var newValue = value
                    newValue.remove(at: idx)
                    if newValue.count == 0 {
                        map[key] = nil
                    } else {
                        map[key] = newValue
                    }
                }
            }
        }
    }
    
    func post(name: String, userInfo: [AnyHashable: Any] = [:]) {
        guard let observers = map[name] else {
            return
        }
        let notification = DNotification(name: name, userInfo: userInfo)
        for observer in observers {
            _ = (observer.object as AnyObject).perform(observer.selecter, with: notification)
        }
    }
    
    
}
