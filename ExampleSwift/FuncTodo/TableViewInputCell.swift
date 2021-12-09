//
//  TableViewInputCell.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/12/9.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

protocol TableViewInputCellDelegate: AnyObject {
    func inputChanged(cell: TableViewInputCell, text: String)
}

class TableViewInputCell: UITableViewCell {
    weak var delegate: TableViewInputCellDelegate?
    @IBOutlet weak var textField: UITextField!
    
    @objc
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        delegate?.inputChanged(cell: self, text: sender.text ?? "")
    }
}
