//
//  HorizontalMovieCell.swift
//  MovieApp
//
//  Created by Fikrat on 01.10.22.
//

import UIKit
import SDWebImage

protocol HorizontalMovieCellProtocol {
    var movieTitleText: String {get}
    var movieImageView: String {get}
    var releaseDateTitleText: String {get}
    var voteAvarageLabelText: Double {get}
    var genreList: [Int] { get }
}

class HorizontalMovieCell: UICollectionViewCell {
    
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var starImage: UIImageView!
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var releaseDateText: UILabel!
    @IBOutlet private weak var releaseDateTitle: UILabel!
    @IBOutlet private weak var voteAvarageLabel: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
    
    var model: MovieResult?
    var genres = [Int]()
    var callBack:  ((Int)->())?
    var viewModel = HomePageViewModel()
    
    override func awakeFromNib() {
        movieImage.layer.cornerRadius = 16
    }
    
    func configCell(items: HorizontalMovieCellProtocol) {
        collection.register(UINib(nibName: "\(HorizontalMovieGenresCell.self)", bundle: nil), forCellWithReuseIdentifier: "HorizontalMovieGenresCell")
        
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

extension HorizontalMovieCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(HorizontalMovieGenresCell.self)", for: indexPath) as! HorizontalMovieGenresCell
        cell.genreConfigure(item: "\(genres[indexPath.item])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionView.frame.height)
    }
}
