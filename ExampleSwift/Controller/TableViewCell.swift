//
//  TableViewCell.swift
//  ExampleSwift
//
//  Created by 杨冬青 on 2021/9/14.
//  Copyright © 2021 杨冬青. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("TableViewCell awakeFromNib")
        
        label.text = "A Label"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
