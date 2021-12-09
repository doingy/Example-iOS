//
//  ControllerAViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/13.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ControllerAViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("A   init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("A   init?(coder: NSCoder)")
    }
    
    override func loadView() {
        super.loadView()
        print("A   loadView")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("A   awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("A   viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("A   viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("A   viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("A   viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("A   viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("A   viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("A   viewDidDisappear")
    }

    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("A   deinit")
    }
}
