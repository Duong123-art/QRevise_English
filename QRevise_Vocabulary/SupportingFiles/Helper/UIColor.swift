//
//  UIColor.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 25/08/2023.
//

import UIKit

extension UIColor {
    enum AppColorType: String {
        case lightBlue, lightOrange, icecream, lightGreen
    }
    
    static func custom(_ type: AppColorType) -> UIColor {
        if let color = UIColor(named: type.rawValue) {
            return color
        }
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    static var lightBlue: UIColor {
        return .custom(.lightBlue)
    }
    
    static var lightOrange: UIColor {
        return .custom(.lightOrange)
    }
    
    static var icecream: UIColor {
        return .custom(.icecream)
    }
    
    static var lightGreen: UIColor {
        return .custom(.lightGreen)
    }
}
