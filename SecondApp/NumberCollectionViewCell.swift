//
//  NumberCollectionViewCell.swift
//  SecondApp
//
//  Created by 大場勇弥 on 2020/11/13.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
    
    let numberLabel: UILabel = {
        let caluculatelabel = UILabel()
        caluculatelabel.textColor = .white
        caluculatelabel.textAlignment = .center
        caluculatelabel.font = .boldSystemFont(ofSize: 20)
        caluculatelabel.clipsToBounds = true
        caluculatelabel.backgroundColor = .orange
        caluculatelabel.text = "1"
        
        return caluculatelabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(numberLabel)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
