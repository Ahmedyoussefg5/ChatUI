//
//  ViewController+Layout.swift
//  ChatUI
//
//  Created by adel radwan on 19/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit
import SnapKit


extension ViewController {
    
    func setupUI(){
        
        view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { (s) in
            s.leading.top.trailing.bottom.equalTo(self.view)
        }
    }
}

//MARK: -  collectionView Item layout
extension
