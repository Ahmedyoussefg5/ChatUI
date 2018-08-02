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
        self.collectionView?.contentInset    = UIEdgeInsetsMake(10, 0, 10, 0)
        self.collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(10, 0, 10, 0)
        self.collectionView?.dataSource      = self
        self.collectionView?.delegate        = self
        self.collectionView?.backgroundColor = .white
        self.collectionView?.keyboardDismissMode = .interactive
        self.collectionView?.alwaysBounceVertical = true 
        self.collectionView?.register(ChatMessageCell.self, forCellWithReuseIdentifier: "cell")
    }
}

//MARK: -  collectionView Item layout
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let h = self.estematedItemHeight(text: self.data[indexPath.row].messageText).height + 30
        
        return CGSize(width: view.frame.width, height: h)
    }
    
    
    func estematedItemHeight(text : String)->CGRect{
        
        let size = CGSize(width: 250, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: option, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
}
