//
//  MyButton.swift
//  2nd-assignment
//
//  Created by Hassan Azhar on 07/07/2022.
//

import Foundation

import UIKit

class MyButton: UIButton {
    var icon: UIImageView!
    var label: UILabel!
    
    convenience init(iconName: String, title: String) {
        self.init()
        icon = UIImageView(image: UIImage(named: iconName))
        self.addSubview(icon)
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        label.text = title
        self.addSubview(label)
        
        // Constraints
        func layoutSubviews(){
            super.layoutSubviews()
            
        }
    
    }
}
