//
//  ExpandCell.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/11/30.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class ExpandCell: UICollectionViewCell {
    static let identifier = "ExpandCell"
    
    lazy var textView: ExpandableTextView = {
        let textView = ExpandableTextView()
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
    
    func config(_ data: String) {
        textView.text = data
    }
    
    func setupViews() {
        textView.translatesAutoresizingMaskIntoConstraints = false;
        contentView.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//            textView.heightAnchor.constraint(equalToConstant: 100)
            textView.heightAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
    }
}
