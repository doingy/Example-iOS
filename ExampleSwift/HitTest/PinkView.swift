//
//  PinkView.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/10/12.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class PinkView: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("PinkView touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("PinkView hitTest")
        return super.hitTest(point, with: event)
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return true
    }
    
    override init(frame: CGRect) {
        print("WhiteView init(frame: CGRect)")
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        print("WhiteView init?(coder: NSCoder)")
        super.init(coder: coder)
        
        print("PinkView \(self.bounds)")
    }
}
