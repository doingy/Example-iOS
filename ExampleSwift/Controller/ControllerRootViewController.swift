//
//  ControllerRootViewController.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/13.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ControllerRootViewController: UIViewController {
    
    @IBAction func presentAction() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "ControllerAViewController")
        let storyboard = UIStoryboard(name: "ControllerB", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ControllerBViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func xibAction() {
        let controller = ControllerCViewController(nibName: "ControllerCViewController", bundle: nil)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("ROOT init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("ROOT init?(coder: NSCoder)")
    }
    
    override func loadView() {
        super.loadView()
        print("ROOT loadView")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("ROOT awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("ROOT viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ROOT viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("ROOT viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ROOT viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ROOT viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ROOT viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ROOT viewDidDisappear")
    }

    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("ROOT deinit")
    }
}
