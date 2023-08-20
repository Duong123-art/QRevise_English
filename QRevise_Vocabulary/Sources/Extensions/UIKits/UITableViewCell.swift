//
//  UITableViewCell.swift
//  QRevise_English
//
//  Created by quang.duong on 20/08/2023.
//

import UIKit
import SnapKit

protocol LoadCellAsNormalView {
    static func loadCellAsNormalView(withOwner owner: Any?) -> Self
}

extension UITableViewCell: LoadCellAsNormalView {
    static func loadCellAsNormalView(withOwner owner: Any?) -> Self  {
        let bundle = Bundle(for: Self.self)
        let nibName = "\(Self.self)"

        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let cell = nib.instantiate(withOwner: owner).first as? Self else {
            fatalError("Cannot load cell as normal view with name: \(nibName), in bundle: \(bundle)")
        }

        cell.awakeFromNib()
        cell.translatesAutoresizingMaskIntoConstraints = false

        cell.snp.makeConstraints { make in
            make.height.equalTo(cell.contentView)
        }

        cell.contentView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }

        cell.contentView.autoresizingMask = [.flexibleHeight]
        cell.layoutIfNeeded()

        return cell
    }
}
