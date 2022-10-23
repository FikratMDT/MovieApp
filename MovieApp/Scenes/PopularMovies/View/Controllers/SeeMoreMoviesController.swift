//
//  SeeMoreMoviesController.swift
//  MovieApp
//
//  Created by Fikrat on 08.10.22.
//

import UIKit

class SeeMoreMoviesController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "\(MovieCategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryCell")
    }
}

extension SeeMoreMoviesController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCategoryCell", for: indexPath) as! MovieCategoryCell
        cell.configeMovieCategoryCell(items: viewModel.movies[indexPath.row])
        return cell
    }
}

