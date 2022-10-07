//
//  MovieHeaderViewController.swift
//  MovieApp
//
//  Created by Fikrat on 06.10.22.
//

import UIKit

class MovieHeaderViewController: UICollectionReusableView {
    
    @IBOutlet private weak var headerTopMovieTitle: UILabel!
    @IBOutlet private weak var headerSeeMoreButton: UIButton!
    @IBOutlet private weak var headerBottomMovieTitle: UILabel!
    @IBOutlet private weak var headerCollection: UICollectionView!
    
    let identifier = "MovieHeaderViewController"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerCollection.register(UINib(nibName: "\(HeaderCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell")
    }
    
}
