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
    let viewModel = MovieViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerCollection.register(UINib(nibName: "\(HeaderCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        
    }
    
    func configure (){
        viewModel.getMovies {
            self.headerCollection.reloadData()
        }
    }
}

extension MovieHeaderViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCollectionViewCell.self)", for: indexPath) as! HeaderCollectionViewCell
        cell.configeMovieHeaderCell(items: viewModel.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //315 -  140
        //width - x
        CGSize(width: frame.width * 140 / 315, height: headerCollection.frame.height)
    }
}
