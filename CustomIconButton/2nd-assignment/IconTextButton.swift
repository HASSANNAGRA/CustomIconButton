//
//  iconTextButton.swift
//  2nd-assignment
//
//  Created by Hassan Azhar on 08/07/2022.
//

import Foundation
import UIKit

protocol IconTextButtonDelegate {
    func btnpressed(selectedButton : IconTextButton)
}

struct IconTextButtonViewModel {
    let text: String
    let imageName : String
    let isSubMenu : Bool
}

final class IconTextButton: UIButton{
    
    var isSubMenu: Bool = false
    var delegate : IconTextButtonDelegate?
    var isButtonSelected = false {
        didSet {
            if isButtonSelected {
                label.textColor = .black
                icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
                icon.tintColor = UIColor.black
                isButtonSelected = true
            } else {
                label.textColor = .white
                icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
                icon.tintColor = UIColor.white
                isButtonSelected = false
            }
        }
    }
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize:15)
        return label
    }()
    private let icon : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(label)
        addSubview(icon)
        isSelected = true
    }
    required init?(coder:NSCoder){
        fatalError()
    }
    func configure(with model:IconTextButtonViewModel){
        label.text = model.text
        icon.image = UIImage(named: model.imageName)
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = UIColor.white
        self.addTarget(nil, action: #selector(self.btnClicked(_:)), for: .touchUpInside)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        icon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: icon.trailingAnchor,constant: 3).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        isSubMenu = model.isSubMenu
    }
    @objc func btnClicked(_ sender: AnyObject?) {
        if sender === self {
            delegate?.btnpressed(selectedButton: sender as! IconTextButton)
        }}}
