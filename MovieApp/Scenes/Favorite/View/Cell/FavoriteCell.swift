//
//  FavoriteCell.swift
//  MovieApp
//
//  Created by Fikrat on 21.08.22.
//

import UIKit
import SDWebImage

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet  weak var favoriteLabel: UILabel!
    @IBOutlet  weak var favoriteImage: UIImageView!
    
    //    func configure(items: MovieCellProtocol ) {
    //        
    ////        favoriteLabel.text = items.movieLabelText
    ////        favoriteImage.sd_setImage(with: URL(string: items.movieImagePosterPath))
    //    }
}
