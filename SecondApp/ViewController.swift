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
        let collectionview = UICollectionView()
        let cellID = "cellID"
        let layout = UICollectionViewFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: cellID)

        return cv
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(discountCollectionView)
    
        discountCollectionView.delegate = self
        discountCollectionView.dataSource = self
        
        textField.delegate = self
       
    }
}

extension ViewController: UITextFieldDelegate {
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NumberCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap")
    }
    
    
}
