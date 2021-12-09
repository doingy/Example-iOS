//
//  ControllerBViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/14.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ControllerBViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        print("B   init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)")
//    }
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        print("B   init?(coder: NSCoder)")
//    }
    
    override func loadView() {
        super.loadView()
        print("B   loadView")
        
        let view = TableViewCell()
        view.backgroundColor = .red
        self.view.addSubview(view)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("B   awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("B   viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("B   viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("B   viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("B   viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("B   viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("B   viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("B   viewDidDisappear")
    }

    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("B   deinit")
    }

}
