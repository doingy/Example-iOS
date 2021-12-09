//: [Previous](@previous)

import Foundation

struct Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    mutating func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}

class Person {
    
}

description("数据绑定字符串", enable: false) {
    var model: Box<String> = Box("")
    model.bind { data in
        print("\(data)")
    }
    
    model.value = "Hello"
    model.value = "World"
}

description("数据绑定数组") {
    var model: Box<[String]> = Box([])
    model.bind { data in
        print("\(data)")
    }
    
    model.value.append("Hello,")
    model.value.append(" World.")
    
    model.value = ["Eric"]
}

description("数据绑定NSArray") {
    var model: Box<NSArray> = Box([])
    model.bind { data in
        print("\(data)")
    }
    
    model.value.adding("Hello")
    model.value.adding("Hello")
//    model.value.append(" World.")
    
    model.value = NSArray(array: ["Error"])
}

//: [Next](@next)
