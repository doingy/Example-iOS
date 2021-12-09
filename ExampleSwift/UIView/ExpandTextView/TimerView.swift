//
//  TimerView.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/11/30.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class TimerView: UIView {
    
    var timer: Timer?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            print("TimerView timerAction")
        }
        RunLoop.current.add(timer, forMode: .common)
        self.timer = timer
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
}
