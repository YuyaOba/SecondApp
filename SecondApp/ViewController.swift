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
        
        label.text = "numberLabel.text"
        label.frame = CGRect(x: 80, y: 110, width:250, height: 40)
        
        
        return label
    }()
    
//    let toolBar:UIToolbar = {
//        let bar = UIToolbar()
//
//        bar.frame = CGRect(x: 0, y: 0, width: 320, height: 40)
//        bar.sizeToFit()
//
//
//        return bar
//    }()
    
    
    let textField: UITextField = {
        let textfield = UITextField()
        
        let userDefaults = UserDefaults()
        userDefaults.register(defaults: ["DataStore": "default"])
        
        textfield.frame = CGRect(x: 80, y: 70, width:250, height: 40)
        textfield.placeholder = "textField.text"
        // キーボードタイプを指定
        textfield.keyboardType = UIKeyboardType.numberPad
        // 枠線のスタイルを設定
        textfield.borderStyle = .roundedRect
        // テキストを全消去するボタンを表示
        textfield.clearButtonMode = .always
        
        
        return textfield
    }()
    
//    let numberToolbar: UIToolbar = {
//        let bar = UIToolbar()
//
//        return bar
//    }()
    
    
    
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
        
        setHideKeyboardTapped()
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textFieldの値保存して、Labelに表記する
        textField.resignFirstResponder()
        
        
        guard let number = textField.text else {
            print("nullでした")
            return false
        }
        print(number)
        numberLabel.text = number
        
        
//
//        if let number = textField.text {
//            print(number)
//        } else {
//          print("nullでした")
//        }
        
        
//        print(numberLabel.text ?? 0)
        
        
        return true
    }
}


//numberLabelを入力して完了して隠す関数
extension UIViewController {
    func setHideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}



extension ViewController: UITextFieldDelegate,UIGestureRecognizerDelegate{
    //他の画面をタップすると閉じるはずが閉じない？
    func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
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
