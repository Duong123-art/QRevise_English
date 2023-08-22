//
//  TitleCollectionViewCell.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 22/08/2023.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var headerTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(title: String) {
        headerTitle.setup(text: title)
    }

}
