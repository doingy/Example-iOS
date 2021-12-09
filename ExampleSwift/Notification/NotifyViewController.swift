//
//  NotifyViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/13.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class NotifyViewController: UIViewController {
    
    var x: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DNotificationCenter.default.addObserver(self, selector: #selector(test(_:)), name: "test")
    }
    
    @objc func test(_ notification: DNotification) {
        print("\(String(describing: notification))")
    }
    
    @objc func testA() {
        print("xxx")
    }
    
    @IBAction func postAction() {
        DNotificationCenter.default.post(name: "test")
    }
    
    @IBAction func addAction() {
        DNotificationCenter.default.addObserver(self, selector: #selector(testA), name: "test")
        DNotificationCenter.default.addObserver(self, selector: #selector(testA), name: "test")
    }
    
    @IBAction func removeAction() {
        DNotificationCenter.default.removeObserver(self)
    }
}
