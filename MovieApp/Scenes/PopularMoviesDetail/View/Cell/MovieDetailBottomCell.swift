//
//  MovieDetailBottomCell.swift
//  MovieApp
//
//  Created by Fikrat on 19.10.22.
//

import UIKit
import SDWebImage

protocol CellProtocol {
    var cellTitle: String { get }
    var cellImage: String { get }
}

class MovieDetailBottomCell: UICollectionViewCell {
    
    @IBOutlet private weak var detailBottomTitleLabel: UILabel!
    @IBOutlet private weak var detailBottomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailBottomImage.layer.cornerRadius = 10
    }
    
    func configure(data: CellProtocol) {
        detailBottomTitleLabel.text = data.cellTitle
        detailBottomImage.sd_setImage(with: URL(string: data.cellImage))
    }
}
