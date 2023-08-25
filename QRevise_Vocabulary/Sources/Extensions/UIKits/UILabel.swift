//
//  UILabel.swift
//  QRevise_English
//
//  Created by quang.duong on 20/08/2023.
//

import UIKit

extension UILabel {
    func setup(text: String, font: AppFontStandard = .body, textColor: UIColor = .lightOrange) {
        self.text = text
        self.font = font.font
        self.textColor = textColor
    }
}
