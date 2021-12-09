//
//  GreenView.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/15.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class GreenView: UIView {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        print("GreenView awakeFromNib")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("GreenView touchesBegan")
    }
}
