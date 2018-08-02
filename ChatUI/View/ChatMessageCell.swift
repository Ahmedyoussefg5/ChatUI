//
//  ChatMessageCell.swift
//  ChatUI
//
//  Created by adel radwan on 19/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit
import SnapKit

class ChatMessageCell: UICollectionViewCell {
    
    var bubbleViewColor : UIColor {
        get { return .black }
        set { self.bubbleView.backgroundColor = newValue }
    }
    
    var bubbleViewCornerRadius : CGFloat {
        get { return 0.0 }
        set { self.bubbleView.layer.cornerRadius = newValue }
    }
    var textColor : UIColor {
        get { return .black }
        set { return self.textView.textColor = newValue }
    }
    
    var bottomViewTextColor : UIColor {
        get { return .red }
        set {
            self.readImageView.tintColor = newValue
            self.timeMessageLabel.textColor = newValue
        }
    }
    
    var timeMessageAlignment : NSTextAlignment {
        get {return .right}
        set{
            self.timeMessageLabel.textAlignment = newValue
        }
    }
    var isHiddeReadImageView : Bool = false {
        didSet{
            if self.isHiddeReadImageView == true  {
                self.readImageView.isHidden = true
                self.remarkConstraintFor(timeLabel: self.timeMessageLabel)
            }//end if
        }//end didSet
    }
    
    
    lazy var textView : UITextView = {
        let t = UITextView(frame: CGRect())
        t.font = UIFont.systemFont(ofSize: 16)
        t.backgroundColor = .clear
        t.textColor = self.textColor
        t.isEditable = false
        t.isScrollEnabled = false
        return t
    }()
    
    
    lazy var bubbleView : UIView = {
        let v = UIView()
        v.backgroundColor = self.bubbleViewColor
        v.layer.cornerRadius = self.bubbleViewCornerRadius
        v.layer.masksToBounds = true
        return v
    }()
    
 
    
  private  var bottomView : UIView = {
       let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
  private lazy var timeMessageLabel : UILabel = {
        let l = UILabel()
        l.textColor = self.bottomViewTextColor
        l.text = "23/07/2018"
        l.font = UIFont.systemFont(ofSize: 11)
        l.textAlignment = self.timeMessageAlignment
    
        return l
    }()
    
  private lazy var readImageView : UIImageView = {
       let i = UIImageView(image: #imageLiteral(resourceName: "read"))
        i.tintColor = self.bottomViewTextColor
        i.contentMode = .scaleAspectFit
        return i
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(self.bubbleView)
        self.bubbleView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.snp.trailing).inset(8)
            s.top.equalTo(self.snp.top)
            s.height.equalTo(self.snp.height)
            s.width.equalTo(250)
        }
        
        addSubview(self.textView)
        self.textView.snp.makeConstraints { (s) in
            s.leading.equalTo(self.bubbleView.snp.leading).inset(8)
            s.top.equalTo(self.snp.top)
            s.trailing.equalTo(self.bubbleView.snp.trailing)
            s.height.equalTo(self.snp.height)
        }
        
        addSubview(self.bottomView)
        self.bottomView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.bubbleView.snp.trailing).inset(8)
            s.bottom.equalTo(self.bubbleView.snp.bottom).inset(4)
            s.leading.equalTo(self.bubbleView.snp.leading).inset(4)
            s.height.equalTo(15)
        }
    
        self.setupReadRespicetUI()
        
    }
    
    
    private func setupReadRespicetUI(){
        
        self.bottomView.addSubview(self.readImageView)
        self.readImageView.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.bottomView.snp.trailing).inset(8)
            s.width.height.equalTo(13)
            s.top.equalTo(self.bottomView.snp.top)
        }
        
        self.bottomView.addSubview(self.timeMessageLabel)
        self.timeMessageLabel.snp.makeConstraints { (s) in
            s.trailing.equalTo(self.readImageView.snp.leading).inset(-4)
            s.leading.equalTo(self.bottomView.snp.leading)
            s.top.equalTo(self.bottomView.snp.top)
            s.bottom.equalTo(self.bottomView.snp.bottom)
        }
        
    }
    
    
  private  func remarkConstraintFor(timeLabel : UILabel){
        timeLabel.snp.remakeConstraints { s in
            s.trailing.equalTo(self.bottomView.snp.trailing).inset(8)
            s.leading.equalTo(self.bottomView.snp.leading).inset(8)
            s.top.equalTo(self.bottomView.snp.top)
            s.bottom.equalTo(self.bottomView.snp.bottom)
        }
    }
    
    
    
    func bubbleView(width:CGFloat){
        self.bubbleView.snp.updateConstraints { (s) in
            s.width.equalTo(width)
        }
    }
    
    func bubbleViewForOtherUser(){
        self.bubbleView.snp.remakeConstraints { (s) in
            s.leading.equalTo(self.snp.leading).inset(8)
            s.top.equalTo(self.snp.top)
            s.height.equalTo(self.snp.height)
            s.width.equalTo(250)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




