//
//  ViewController.swift
//  ChatUI
//
//  Created by adel radwan on 19/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
   lazy var collectionView : UICollectionView = {
       let c = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        c.contentInset    = UIEdgeInsetsMake(20, 0, 0, 0)
        c.dataSource      = self
        c.delegate        = self
        c.backgroundColor = .white
        c.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "CHAT UI"
    }

 


}

