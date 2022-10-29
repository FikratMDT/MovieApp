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
    var genreList: [Int] { get }
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
    var genres = [Int]()
    var callBack:  ((Int)->())?
    var viewModel = MovieViewModel()
    
    override func awakeFromNib() {
        movieImage.layer.cornerRadius = 16
    }
    
    func configeMovieCategoryCell (items: MovieCategoryCellProtocol) {
        collection.register(UINib(nibName: "\(MovieCategoryGenreCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryGenreCell")
        
        movieTitle.text = items.movieTitleText
        releaseDateText.text = items.releaseDateTitleText
        //        releaseDateTitle.text = items.releaseDateTextPr
        movieImage.sd_setImage(with: URL(string: items.movieImageView))
        //        voteAvarageLabel.text = "\(items.voteAvarageLabelText  % .2f) /10"
        voteAvarageLabel.text = "\(String(format: "%.1f", items.voteAvarageLabelText))/10 IMDb"
        genres = items.genreList
        collection.reloadData()
    }
}

extension MovieCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(MovieCategoryGenreCell.self)", for: indexPath) as! MovieCategoryGenreCell
        cell.genreConfigure(item: "\(genres[indexPath.item])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionView.frame.height)
    }
}
