//
//  UILabel.swift
//  QRevise_English
//
//  Created by quang.duong on 20/08/2023.
//

import UIKit

extension UILabel {
    func setup(text: String,
               font: UIFont = .systemFont(ofSize: 14,
                                          weight: .semibold),
               textColor: UIColor = .black,
               textAlign: NSTextAlignment = .left
    ) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlign
    }
}
