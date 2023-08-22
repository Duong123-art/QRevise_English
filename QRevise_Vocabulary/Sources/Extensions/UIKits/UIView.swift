//
//  UIView.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 21/08/2023.
//

import UIKit

extension UIView {
    func setCornersBorder(cornerRadius: CGFloat = 6,
                          borderColor: UIColor = .gray.withAlphaComponent(0.4),
                          borderWidth: CGFloat = 1) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
