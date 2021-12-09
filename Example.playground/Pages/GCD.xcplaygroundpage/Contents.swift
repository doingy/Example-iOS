//: [Previous](@previous)

import Foundation

description("队列创建", enable: false) {
    // 并发队列
    var queue = DispatchQueue(label: "com.yangdq.gcd", attributes: .concurrent)
    print(queue)
    
    // 并行队列
    queue = DispatchQueue(label: "com.yangdq.gcd")
    print(queue)
    
    queue = DispatchQueue.main
    print(queue)
    
    queue = DispatchQueue.global()
    print(queue)
    
    queue = DispatchQueue.global(qos: .utility)
    print(queue)
}

description("并发队列+同步执行", enable: false) {
    print("开始 \(Thread.current)")
    let queue = DispatchQueue(label: "com.yangdq.gcd", attributes: .concurrent)
    queue.sync {
        // 任务1
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务1 \(Thread.current)")
        }
    }
    
    queue.sync {
        // 任务2
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务2 \(Thread.current)")
        }
    }
    
    queue.sync {
        // 任务3
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务3 \(Thread.current)")
        }
    }
    print("结束")
}

description("并发队列+异步执行", enable: false) {
    print("开始 \(Thread.current)")
    let queue = DispatchQueue(label: "com.yangdq.gcd", attributes: .concurrent)
    queue.async {
        // 任务1
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务1 \(Thread.current)")
        }
    }
    
    queue.async {
        // 任务2
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务2 \(Thread.current)")
        }
    }
    
    queue.async {
        // 任务3
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务3 \(Thread.current)")
        }
    }
    print("结束")
}

description("串行队列+同步执行", enable: false) {
    print("开始 \(Thread.current)")
    let queue = DispatchQueue(label: "com.yangdq.gcd")
    queue.sync {
        // 任务1
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务1 \(Thread.current)")
        }
    }
    
    queue.sync {
        // 任务2
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务2 \(Thread.current)")
        }
    }
    
    queue.sync {
        // 任务3
        for _ in 0 ..< 2 {
            Thread.sleep(forTimeInterval: 2)
            print("任务3 \(Thread.current)")
        }
    }
    print("结束")
}

description("串行队列+异步执行", enable: false) {
    print("开始 \(Thread.current)")
    let queue = DispatchQueue(label: "com.yangdq.gcd")
    queue.async {
        // 任务1
        for _ in 0 ..< 2 {
            print("任务1 \(Thread.current)")
        }
    }
    
    queue.async {
        // 任务2
        for _ in 0 ..< 2 {
            print("任务2 \(Thread.current)")
        }
    }
    
    queue.async {
        // 任务3
        for _ in 0 ..< 2 {
            print("任务3 \(Thread.current)")
        }
    }
    print("结束")
}

description("主队列+同步执行", enable: false) {
    //: 死锁
    let queue = DispatchQueue.main
    
    queue.sync {
        print("任务")
    }
}

description("栅栏函数", enable: true) {
    // dispatch_barrier_async
    let queue = DispatchQueue(label: "com.yangdq.gcd", attributes: .concurrent)
    
    queue.async {
        Thread.sleep(forTimeInterval: 1)
        print("任务 1")
    }
    
    queue.async {
        Thread.sleep(forTimeInterval: 1)
        print("任务 2")
    }
    
    queue.async {
        Thread.sleep(forTimeInterval: 1)
        print("任务 3")
    }
    
    queue.async(flags: .barrier) {
        // 任务 barrier
        for _ in 0 ..< 2 {
//            Thread.sleep(forTimeInterval: 2)
            print("任务 barrier \(Thread.current)")
        }
    }
    
    queue.async {
        print("任务 4")
    }
    
    queue.async {
        print("任务 5")
    }
}

//: [Next](@next)
