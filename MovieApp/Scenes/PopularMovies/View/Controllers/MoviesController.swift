//
//  MoviesController.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

class MoviesController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    let viewModel = MovieViewModel()
    let context = AppDelegate().persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        print("test")
        viewModel.getMovies {
            self.collection.reloadData()
        }
        
        collection.register(UINib(nibName: "\(MovieCategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryCell")
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
//        saveData(favorites: , favoriteImage: <#T##String#>)
    }
    
//    func saveData(favorite: Result) {
//        let model = Favorite(context: context)
//        model.favorites = favorite.movieLabelText
//        model.favoriteImage = favorite.movieImagePosterPath
//        do {
//            try context.save()
//        } catch{
//            print(error.localizedDescription)
//        }
//    }
}

extension MoviesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCategoryCell", for: indexPath) as! MovieCategoryCell
        cell.tag = indexPath.item
//        cell.configure(items: viewModel.movies[indexPath.item])
        cell.configeMovieCategoryCell(items: viewModel.movies[indexPath.row])
//        cell.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(viewModel.movies[indexPath.item].posterPath)"))
        cell.callBack = { index in
//            self.saveData(favorite: self.viewModel.movies[index])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(MovieVCHeaderView.self)", for: indexPath)
        return headerView
    }
}
