//
//  SeeMoreMoviesController.swift
//  MovieApp
//
//  Created by Fikrat on 08.10.22.
//

import UIKit

class SeeMoreMoviesController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "HorizontalMovieCell")
    }
}

extension SeeMoreMoviesController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalMovieCell", for: indexPath) as! HorizontalMovieCell
        cell.configCell(items: viewModel.movies[indexPath.row])
        return cell
    }
}

