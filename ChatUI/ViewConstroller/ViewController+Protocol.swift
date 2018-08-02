//
//  ViewController+Protocol.swift
//  ChatUI
//
//  Created by adel radwan on 19/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit

//MARK: - UICollectionViewDataSource
extension ViewController  {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChatMessageCell
        
        let messageUser = self.data[indexPath.row]
        
        cell.textView.text = self.data[indexPath.row].messageText
        
        if messageUser.userId == "1234"{ //from user
            cell.bubbleViewColor = .black
            cell.isHiddeReadImageView   = false
            cell.timeMessageAlignment   = .right
        }else{ // to user
            cell.bubbleViewColor = .red
            cell.bubbleViewForOtherUser()
            cell.isHiddeReadImageView   = true
            cell.timeMessageAlignment   = .left
        }
        
        
        cell.bottomViewTextColor    = .yellow
        cell.textColor              = .white
        cell.bubbleViewCornerRadius = 5
        cell.bubbleView(width: self.estematedItemHeight(text: self.data[indexPath.row].messageText).width + 32)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController  {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

