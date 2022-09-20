//
//  MovieCell.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import SDWebImage

protocol MovieCellProtocol{
    var movieLabelText: String { get }
    var movieImagePosterPath: String { get }
    var movieId: Int { get }
}

class MovieCell: UICollectionViewCell {
    @IBOutlet  private weak var movieImage: UIImageView!
    @IBOutlet  private weak var movieLabel: UILabel!
    @IBOutlet  private weak var favoriteButtonView: UIButton!
    
    var callBack:  ((Int)->())?
   
    func configure(items: MovieCellProtocol ) {
        movieLabel.text = items.movieLabelText
        movieImage.sd_setImage(with: URL(string: items.movieImagePosterPath))
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        callBack?(tag)
        favoriteButtonView.setImage(UIImage(named: "starFill"), for: .normal)
        
    }
    
}
