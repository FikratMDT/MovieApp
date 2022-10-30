//
//  HeaderCollectionViewCell.swift
//  MovieApp
//
//  Created by Fikrat on 07.10.22.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var headerCellMovieTitle: UILabel!
    @IBOutlet private weak var headerCellImageView: UIImageView!
    @IBOutlet private weak var headerCellVoteAvarageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerCellImageView.layer.cornerRadius = 10
    }
    
    func configeMovieHeaderCell (items: MovieCategoryCellProtocol) {
        headerCellMovieTitle.text = items.movieTitleText
        headerCellImageView.sd_setImage(with: URL(string: items.movieImageView))
        headerCellVoteAvarageLabel.text = "\(String(format: "%.1f", items.voteAvarageLabelText))/10 IMDb"
    }
}
