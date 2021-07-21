//
//  TextCollectionViewCell.swift
//  Demo1
//
//  Created by Hoang Anh Tuan on 21/07/2021.
//

import UIKit


class TextCollectionViewCell: UICollectionViewCell {
    
    var item :TextViewItem?

    @IBOutlet weak var tvItem: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
