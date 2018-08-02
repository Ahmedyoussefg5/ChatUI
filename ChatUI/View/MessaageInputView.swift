//
//  MessaageInputView.swift
//  ChatUI
//
//  Created by adel radwan on 20/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit


protocol  MessaageInputViewDelegate {
    func updateInputView(_ estematedSize : CGSize)
    func sendMessge(text : String)
}

class MessaageInputView: UIView{
    
    
    var holderViewBackground : UIColor {
        get { return .white }
        set { self.holderView.backgroundColor = newValue }
    }
    
    var minmumHeight : CGFloat {
        var h : CGFloat = 0.0
        UIDevice().detect { d in
            
            if d == .iphoneX {
                h =  70
            }else{
                h =  55
            }
        }
        return h
    }
    
    var delegate : MessaageInputViewDelegate?
    
    
    private lazy var holderView : UIView = {
        let v = UIView()
        v.backgroundColor = self.holderViewBackground
        return v
    }()
    
    var textColor : UIColor {
        get { return .black }
        set { self.textView.textColor = newValue }
    }
    
    var textFont : UIFont {
        get { return UIFont.preferredFont(forTextStyle: .headline) }
        set { self.textView.font = newValue }
    }
    
    var textCornerRadius : CGFloat {
        get { return 0.0 }
        set { self.textView.layer.cornerRadius = newValue }
    }
    
    var textBorderWidth : CGFloat {
        get { return 0 }
        set { self.textView.layer.borderWidth = newValue }
    }
    
    var textBorderColor : UIColor {
        get{ return .clear }
        set { self.textView.layer.borderColor = newValue.cgColor }
    }
    
    var placeholderColor : UIColor {
        get { return UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) }
        set { self.placeholderLabel.textColor = newValue }
    }
    
    var placeholderFont : UIFont {
        get { return UIFont.preferredFont(forTextStyle: .caption1) }
        set{ self.placeholderLabel.font = newValue }
    }
    
    var placeholder : String {
        get { return "Send Message..." }
        set{ self.placeholderLabel.text = newValue }
    }
    
    var sendButtonColor : UIColor {
        get{ return .red }
        set { self.sendButton.tintColor = newValue }
    }
    
    var sendButtonImage : UIImage {
        get { return #imageLiteral(resourceName: "sendMessageBtn") }
        set { self.sendButton.setImage(newValue, for: .normal) }
    }
    
    private lazy var placeholderLabel : UILabel = {
        let l = UILabel()
        l.text      = self.placeholder
        l.font      = self.placeholderFont
        l.textColor = self.placeholderColor
        return l
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.delegate = self
        textView.layer.borderColor  = self.textBorderColor.cgColor
        textView.layer.borderWidth  = self.textBorderWidth
        textView.isScrollEnabled    = false
        textView.layer.cornerRadius = self.textCornerRadius
        textView.textColor          = self.textColor
        textView.font               = self.textFont
        return textView
    }()
    
    lazy var sendButton : UIButton = {
        let btn = UIButton(type:.system)
        btn.setImage(self.sendButtonImage, for: .normal)
        btn.tintColor = self.sendButtonColor
        btn.isHidden  = true
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(sendFuckingMessage), for: .touchUpInside)
        return btn
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(self.holderView)
        self.holderView.snp.makeConstraints { (s) in
            s.leading.equalTo(self.snp.leading)
            s.trailing.equalTo(self.snp.trailing)
            s.top.equalTo(self.snp.top)
            s.bottom.equalTo(self.snp.bottom)
        }
        
        self.holderView.addSubview(self.textView)
        self.textView.snp.makeConstraints { (s) in
            s.leading.equalTo(self.holderView.snp.leading).inset(8)
            s.trailing.equalTo(self.holderView.snp.trailing).inset(8)
            UIDevice().detect(completion: { d in
                if d == .iphoneX {
                    s.bottom.equalTo(self.holderView.snp.bottom).inset(17)
                }else{
                    s.bottom.equalTo(self.holderView.snp.bottom).inset(12)
                }
            })
            s.height.equalTo(40)
        }
        
        self.textView.addSubview(self.placeholderLabel)
        self.placeholderLabel.snp.makeConstraints { (s) in
            s.leading.equalTo(self.textView.snp.leading).inset(8)
            s.trailing.equalTo(self.textView.snp.trailing).inset(8)
            s.height.equalTo(30)
            s.centerY.equalTo(self.textView.snp.centerY)
        }
        
        self.holderView.addSubview(self.sendButton)
        self.sendButton.snp.makeConstraints { (s) in
            s.leading.equalTo(self.textView.snp.trailing)
            s.trailing.equalTo(self.holderView.snp.trailing)
            s.bottom.equalTo(self.textView.snp.bottom)
            s.height.equalTo(30)
        }
        
    }
    
    @objc func sendFuckingMessage(){
        
        guard let d = self.delegate else { return }
        d.sendMessge(text: self.textView.text)
        self.textView.text = nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
//MARK: - TextViewDelegate
extension MessaageInputView : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.placeholderLabel.isHidden = textView.text.isEmpty ? false : true
        
        if !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.snp.updateConstraints { (s) in
                s.trailing.equalTo(self.holderView.snp.trailing).inset(50)
            }
            self.sendButton.isHidden = false
            
        }else{
            textView.snp.updateConstraints { (s) in
                s.trailing.equalTo(self.holderView.snp.trailing).inset(8)
            }
            self.sendButton.isHidden = true
        }
        let size = CGSize(width: UIScreen.main.bounds.width - 58, height: .infinity)
        
        let estematedSize =  textView.sizeThatFits(size)
    
        
        if estematedSize.height >= 116 {
            textView.isScrollEnabled = true
        }else{
              let _ = textView.constraints.filter{ $0.firstAttribute == .height }.map{ $0.constant = estematedSize.height }
            textView.isScrollEnabled = false 
        }
        
        guard let d = self.delegate else {
            return
        }
      
        d.updateInputView(estematedSize)
        
    }
    
}
