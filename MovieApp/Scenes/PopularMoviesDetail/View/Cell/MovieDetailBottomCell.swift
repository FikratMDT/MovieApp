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

    @IBOutlet weak var detailBottomTitleLabel: UILabel!
    @IBOutlet weak var detailBottomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailBottomImage.layer.cornerRadius = 10
    }
    
    override func layoutSubviews() {
    }
    
    func castConfigure (items: CellProtocol) {
        detailBottomTitleLabel.text = items.cellTitle
        detailBottomImage.sd_setImage(with: URL(string: items.cellImage))
    }
    
    func similiarConfigure (items: CellProtocol) {
        detailBottomTitleLabel.text = items.cellTitle
        detailBottomImage.sd_setImage(with: URL(string: items.cellImage))        
    }
}
