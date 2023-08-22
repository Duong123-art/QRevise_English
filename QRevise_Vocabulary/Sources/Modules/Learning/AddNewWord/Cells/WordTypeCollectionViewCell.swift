//
//  WordTypeCollectionViewCell.swift
//  QRevise_Vocabulary
//
//  Created by quang.duong on 22/08/2023.
//

import UIKit

class WordTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var workTypeIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(url: String) {
        workTypeIcon.loadImageFromNetWork(url: url)
        workTypeIcon.contentMode = .scaleToFill
    }

}
