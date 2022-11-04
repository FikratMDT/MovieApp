//
//  HomePageController.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

class HomePageController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    let viewModel = HomePageViewModel()
    let context = AppDelegate().persistentContainer.viewContext
    let movieID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        configNavigationBarView()
        register()
        configure()
    }
    
    fileprivate func configure() {
        viewModel.getMovies()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    func register() {
        collection.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "HorizontalMovieCell")
        
        collection.register(UINib(nibName: "\(HomePageHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomePageHeader.self)")
    }
    
    func configNavigationBarView () {
        
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
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(FilterCategoriesController.self)") as! FilterCategoriesController
        present(controller, animated: true)
        controller.callBack = { type in
            self.viewModel.movies.removeAll()
            self.viewModel.category = type
            self.viewModel.getMovies()
        }
    }
}

extension HomePageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalMovieCell", for: indexPath) as! HorizontalMovieCell
        cell.tag = indexPath.item
        cell.configCell(items: viewModel.movies[indexPath.row])
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
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetailController.self)") as! MovieDetailController
        let item = viewModel.movies[indexPath.item]
        controller.viewModel.id = item.movieId
        show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomePageHeader.self)", for: indexPath) as! HomePageHeader
        header.configHeader()
        header.seeMoreCallBack = {
            print("seemore")
        }
        header.headerDidSelected = {
//            let item = self.viewModel.movies[indexPath.item]
//            viewModel.id = item.movieId
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

