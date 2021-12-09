//
//  TodoStore.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import Foundation

let dummy = [
    "Swift",
    "Java",
    "JavaScript"
]

struct TodoStore {
    static let shared = TodoStore()
    
    func getTodoItems(completionHandler: (([String]) -> Void)?) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler?(dummy)
        }
    }
}
