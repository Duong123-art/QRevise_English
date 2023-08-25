//
//  UIFont.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 25/08/2023.
//

import UIKit

extension UIFont {
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Nexa-Trial-Heavy", size: size).unsafelyUnwrapped
    }
    
    static func demiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Nexa-Trial-Bold", size: size).unsafelyUnwrapped
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return UIFont(name: "Nexa-Trial-Regular", size: size).unsafelyUnwrapped
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Nexa-Trial-Thin", size: size).unsafelyUnwrapped
    }
}


enum AppFontStandard {
    case header, subHeader, title, body
    
    var font: UIFont {
        switch self {
        case .title:
            return .regular(size: 14)
        case .body:
            return .medium(size: 16)
        case .subHeader:
            return .demiBold(size: 22)
        case .header:
            return .bold(size: 24)
        }
    }
}
