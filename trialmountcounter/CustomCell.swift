//
//  CustomCell.swift
//  trialmountcounter
//
//  Created by Joy Leger on 2020-05-25.
//  Copyright © 2020 Joy Leger. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell{
    
    var mountName : String?
    
    var mountNameView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(mountNameView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
