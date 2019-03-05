//
//  HeroCell.swift
//  Marvel
//
//  Created by Farhad Faramarzi on 3/5/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

class HeroCell: UICollectionViewCell {
    
    let stack = UIStackView()
    let image = UIImageView()
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stack)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(title)
        stack.axis = .vertical
        
        // title
        title.textAlignment = .center
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 13)
        
        // image
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        // sorry, you should use this cell in your code :D :Farhad
        fatalError()
    }
    
    func config(model: Character) {
        let link = "\(model.thumbnail.path).\(model.thumbnail.thumbnailExtension)"
        image.setImage(url: link)
        title.text = model.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
