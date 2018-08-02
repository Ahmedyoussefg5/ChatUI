//
//  ViewController.swift
//  ChatUI
//
//  Created by adel radwan on 19/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController , MessaageInputViewDelegate {
    
    
    private var messageDataFromUser = ["is simply dummy text of the printing and typesetting industry",
                                       "Lorem Ipsum has been the industry's standard dummy",
                                       "text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has "]
    
    
    
    private var messageDataToUser = ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The poin",
                                     "packages and web page editors now use Lorem Ipsum as their default model text, and a search for"]
    


    
    
    private lazy var inputToolbar: MessaageInputView = {
        let v = MessaageInputView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: v.minmumHeight)
        v.holderViewBackground = UIColor(white: 0.95, alpha: 1.0)
        v.textBorderColor = .red
        v.textBorderWidth = 2
        v.textCornerRadius = 10
        v.delegate       = self
        return v
    }()    
    
    var data : [MessageModel] = [MessageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "CHAT UI"
        self.setupUI()
        self.data.append(MessageModel(userId: "1234", messageText: "hellow All"))
        self.data.append(MessageModel(userId: "5678", messageText: "iam second user"))
        self.data.append(MessageModel(userId: "1234", messageText: self.messageDataFromUser[0]))
        self.data.append(MessageModel(userId: "5678", messageText: self.messageDataToUser[1]))
        self.data.append(MessageModel(userId: "1234", messageText: self.messageDataFromUser[1]))
        self.data.append(MessageModel(userId: "1234", messageText: self.messageDataFromUser[2]))
        self.data.append(MessageModel(userId: "5678", messageText: self.messageDataToUser[0]))
        
    }
    
    override var inputAccessoryView: UIView?{
        return inputToolbar
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    func updateInputView(_ estematedSize: CGSize) {
        self.inputAccessoryView?.translatesAutoresizingMaskIntoConstraints = false
        
        if estematedSize.height <= 116 {
            let _ = self.inputAccessoryView?.constraints.filter{ $0.firstAttribute == .height }.map{ $0.constant = estematedSize.height + 30 }
        }
    }
    
    func sendMessge(text: String) {
        print(text)
    }
}

