//
//  HomePageHeader.swift
//  MovieApp
//
//  Created by Fikrat on 06.10.22.
//

import UIKit

class HomePageHeader: UICollectionReusableView {
    
    @IBOutlet private weak var headerTopMovieTitle: UILabel!
    @IBOutlet private weak var headerSeeMoreButton: UIButton!
    @IBOutlet private weak var headerBottomMovieTitle: UILabel!
    @IBOutlet private weak var headerCollection: UICollectionView!
    
    let identifier = "MovieHeaderViewController"
    let viewModel = HomePageViewModel()
    var seeMoreCallBack: (() -> ())?
    var headerDidSelected: (()->())?
    var items = [MovieResult]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerCollection.register(UINib(nibName: "\(VerticalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "VerticalMovieCell")
        configSeeMoreButton()
//        headerBottomMovieTitle.text = "\(categories[0])"
    }
    
//    func configureHeader () {
//        viewModel.getMovies {
//            self.headerCollection.reloadData()
//        }
//    }
    
    func configHeader() {
        viewModel.getNowPlaying()
        viewModel.successCallback = {
            self.headerCollection.reloadData()
        }
    }
    
    func configSeeMoreButton() {
        headerSeeMoreButton.layer.borderWidth = 0.2
        headerSeeMoreButton.layer.cornerRadius = 10
    }
    
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        seeMoreCallBack?()
    }
}

extension HomePageHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VerticalMovieCell.self)", for: indexPath) as! VerticalMovieCell
        cell.configCell(items: viewModel.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        headerDidSelected = {
//            let item = self.viewModel.movies[indexPath.item]

        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //315 -  140
        //width - x
        CGSize(width: frame.width * 140 / 315, height: headerCollection.frame.height)
    }
}
