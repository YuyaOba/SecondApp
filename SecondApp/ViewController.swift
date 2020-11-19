//
//  ViewController.swift
//  SecondApp
//
//  Created by 大場勇弥 on 2020/11/12.
//  Copyright © 2020 大場勇弥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellID = "cellID"
    
    let textField: UITextField = {
        let textfield = UITextField()
    
    textfield.frame = CGRect(x: 90, y: 100, width:250, height: 40)
    textfield.placeholder = "入力してください。"
    // キーボードタイプを指定
    textfield.keyboardType = UIKeyboardType.numberPad
    // 枠線のスタイルを設定
    textfield.borderStyle = .roundedRect
    // テキストを全消去するボタンを表示
    textfield.clearButtonMode = .always
    
    return textfield
    }()
    
    let discountCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
     
        return cv
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(discountCollectionView)
        
       discountCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        discountCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
       discountCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        discountCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        discountCollectionView.contentInsetAdjustmentBehavior = .never
        discountCollectionView.backgroundColor = .red
        
        discountCollectionView.delegate = self
        discountCollectionView.dataSource = self
        
        textField.delegate = self
       
    }
}

extension ViewController: UITextFieldDelegate {
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NumberCollectionViewCell
        
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap")
    }
    
    
}
