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
    let movieID = 0
    var catehgory = FilterCategories()
    
    fileprivate func configure() {
        viewModel.getMovies()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        configNavigationBarView()
        
        registerVC()
        
        configure()
    }
    
    
    func registerVC() {        
        collection.register(UINib(nibName: "\(MovieCategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryCell")
        
        collection.register(UINib(nibName: "\(MovieHeaderViewController.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieHeaderViewController.self)")
    }
    
    func configNavigationBarView (){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
//    @IBAction func favoriteButton(_ sender: Any) {
////        saveData(favorites: , favoriteImage: <#T##String#>)
//    }
    
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
    
    
    @IBAction func filterButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(FilterCategories.self)") as! FilterCategories
        present(controller, animated: true)
        controller.callBack = { type in
            self.viewModel.movies.removeAll()
            self.viewModel.category = type
            self.viewModel.getMovies()
        }
    }
    
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
        //812 -  120
        //width - x
        CGSize(width: collectionView.frame.width * 0.96, height: view.frame.height * 120 / 812)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetailVC.self)") as! MovieDetailVC
        let item = viewModel.movies[indexPath.item]
        controller.viewModel.id = item.movieId
        show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieHeaderViewController.self)", for: indexPath) as! MovieHeaderViewController
        header.configHeader()
        header.seeMoreCallBack = {
            print("seemore")
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.row)
        
    }
}

