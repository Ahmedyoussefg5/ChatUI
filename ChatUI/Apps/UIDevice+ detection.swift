//
//  UIDevice+detecteton.swift
//  ChatUI
//
//  Created by adel radwan on 20/11/1439 AH.
//  Copyright © 1439 adel radwan. All rights reserved.
//

import UIKit

enum DeviceType  {
    case iphoneSmall,iphoneMiddel,iphonePlus,iphoneX
}

extension UIDevice {
    
    func detect(completion : @escaping( _ type : DeviceType)->Void = { _ in }){
        
            switch self.nativeHeighForDevice() {
            case 1136:
                completion(.iphoneSmall)
            case 1334:
                completion(.iphoneMiddel)
            case 1920, 2208:
                completion(.iphonePlus)
            case 2436:
                 completion(.iphoneX)
            default:
                completion(.iphoneX)

            }//end switcher
    }
    
    
    private func nativeHeighForDevice()->CGFloat {
        return UIScreen.main.nativeBounds.height
    }
    
}
