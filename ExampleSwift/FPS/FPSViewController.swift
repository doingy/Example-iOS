//
//  FPSViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/14.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class FPSViewController: UIViewController {
    
    @IBOutlet var fpsLabel: UILabel!
    
    @IBOutlet var containerView: UIView!
    
    var link: CADisplayLink!
    var count: Int = 0
    var lastTime: TimeInterval = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        let proxy = WeakProxy(target: self)
        link = CADisplayLink(target: proxy, selector: #selector(tick(link:)))
        link.add(to: RunLoop.main, forMode: .common)
        containerView.backgroundColor = .green
    }
    
    @objc func tick(link: CADisplayLink) {
        guard lastTime != 0 else {
            lastTime = link.timestamp
            return
        }
        
        count += 1;
        
        let timePassed = link.timestamp - lastTime
        guard timePassed > 1 else {
            return
        }
        lastTime = link.timestamp
        
        let fps = Double(count) / timePassed
        count = 0
        fpsLabel.text = " \(fps) "
        
    }
    
    deinit {
        link.invalidate()
        print("FPSViewController deinit")
    }
    
    @IBAction func runAction() {
        for i in 0 ... 10000 {
            let view = UIView(frame: self.containerView.bounds)
            view.alpha = CGFloat(i) * 0.001
            view.backgroundColor = .white
            self.containerView.addSubview(view)
        }
        self.containerView.subviews.forEach({ $0.removeFromSuperview() })
    }

}
