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
    
    //配列Int型と指定した上で、値を代入してあげる
    let numberCell: [[Double]] = [[0.3,0.5,0.1,1.0,1.5,1.6],[0.3,0.5,0.1,1.0,1.5,1.6]]
    
    
    let numberLabel: UILabel = {
        let label = UILabel()

        label.text = "ここに値が表示されるぉ"
        label.frame = CGRect(x: 80, y: 110, width:250, height: 40)


        return label
    }()
    
    let textField: UITextField = {
        let textfield = UITextField()
        
        let userDefaults = UserDefaults()
        userDefaults.register(defaults: ["DataStore": "default"])
        
        textfield.frame = CGRect(x: 80, y: 70, width:250, height: 40)
        textfield.placeholder = "入力してください。"
        // キーボードタイプを指定
        textfield.keyboardType = UIKeyboardType.default
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
        view.addSubview(numberLabel)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        numberLabel.text = textField.text
        return true
    }
}

extension ViewController: UITextFieldDelegate {
    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NumberCollectionViewCell
        
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let number = numberCell[indexPath.section][indexPath.row]
        print(number)
    }
    
    
}
