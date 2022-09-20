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
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
//        saveData(favorites: , favoriteImage: <#T##String#>)
    }
    
    func saveData(favorite: Result) {
        let model = Favorite(context: context)
        model.favorites = favorite.movieLabelText
        model.favoriteImage = favorite.movieImagePosterPath
        do {
            try context.save()
        } catch{
            print(error.localizedDescription)
        }
    }
}

extension MoviesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.tag = indexPath.item
        cell.configure(items: viewModel.movies[indexPath.item])
//        cell.movieImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(viewModel.movies[indexPath.item].posterPath)"))
        cell.callBack = { index in
            self.saveData(favorite: self.viewModel.movies[index])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetailVC.self)") as! MovieDetailVC
//        controller.movieLabelDetail?.text = viewModel.movies[indexPath.item].movieLabelText
        let item = viewModel.movies[indexPath.item]
        controller.viewModel.id = item.movieId
        print(item.movieId, "id")
//        controller.viewModel = MovieDetailViewModel(id: viewModel.movies[indexPath.item].movieId)
        show(controller, sender: nil)
    }
}
