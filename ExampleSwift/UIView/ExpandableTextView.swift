//
//  ExpandableTextView.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/11/30.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import Foundation
import UIKit

class ExpandableTextView: UIView {
    
    var text: String = "" {
        didSet {
            textView.text = text
        }
    }
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textView.textContainer.size = textView.bounds.size
    }
    
    func setupViews() {
        addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textView.widthAnchor.constraint(equalTo: self.widthAnchor),
            textView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
}
