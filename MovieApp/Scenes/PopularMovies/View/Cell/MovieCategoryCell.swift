//
//  MovieCategoryCell.swift
//  MovieApp
//
//  Created by Fikrat on 01.10.22.
//

import UIKit
import SDWebImage

protocol MovieCategoryCellProtocol {
    var movieTitleText: String {get}
    var movieImageView: String {get}
    var releaseDateTitleText: String {get}
    var voteAvarageLabelText: Double {get}
//    var releaseDateTextPr: String {get}
}

class MovieCategoryCell: UICollectionViewCell {

    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var starImage: UIImageView!
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var releaseDateText: UILabel!
    @IBOutlet private weak var releaseDateTitle: UILabel!
    @IBOutlet private weak var voteAvarageLabel: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
        
    var model: Result?
    var callBack:  ((Int)->())?
        
    override func layoutSubviews() {
        collection.register(UINib(nibName: "\(MovieCategoryGenreCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryGenreCell")
        setImage()
    }
    
    func setImage(){
        movieImage.layer.cornerRadius = 10
    }
    
    func configeMovieCategoryCell (items: MovieCategoryCellProtocol) {
        movieTitle.text = items.movieTitleText
        releaseDateText.text = items.releaseDateTitleText
//        releaseDateTitle.text = items.releaseDateTextPr
        movieImage.sd_setImage(with: URL(string: items.movieImageView))
        voteAvarageLabel.text = "\(items.voteAvarageLabelText * 10) %"
    }
}

extension MovieCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    model?.genreIDS.count ?? Int(0)
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(MovieCategoryGenreCell.self)", for: indexPath) as! MovieCategoryGenreCell
    releaseDateText.text = "Test"
    return cell
}

}
