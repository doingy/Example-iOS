//
//  ControllerCViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/14.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ControllerCViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        print("C   init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)")
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        print("C   init?(coder: NSCoder)")
//        view.backgroundColor = .red
//    }
    
    override func loadView() {
        super.loadView()
        print("C   loadView")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("C   awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("C   viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("C   viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("C   viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("C   viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("C   viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("C   viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("C   viewDidDisappear")
    }

    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("C   deinit")
    }
}
