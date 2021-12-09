//
//  WhiteVIew.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class WhiteView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        print("WhiteView awakeFromNib")
    }
    
    override init(frame: CGRect) {
        print("WhiteView init(frame: CGRect)")
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        print("WhiteView init?(coder: NSCoder)")
        super.init(coder: coder)
        
        print("WhiteView \(self.bounds)")
        let bounds = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.bounds = bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("WhiteView touchesBegan")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let newFrame = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y - 20, width: bounds.size.width + 40, height: bounds.size.height + 40)
        return newFrame.contains(point)
    }
    
}
