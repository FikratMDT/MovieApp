//
//  FavoriteController.swift
//  MovieApp
//
//  Created by Fikrat on 15.08.22.
//

import UIKit
import CoreData

class FavoriteController: UIViewController {

    @IBOutlet private weak var collection: UICollectionView!


    let viewModel = FavoriteManager.shared
    let movieViewModel = MovieViewModel()
    let context = AppDelegate().persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Favorites"
    }

    override func viewWillAppear(_ animated: Bool) {
        
        FavoriteManager.shared.fetch {
            self.collection.reloadData()
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.favoriteList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(FavoriteCell.self)", for: indexPath) as! FavoriteCell
        cell.favoriteLabel?.text = viewModel.favoriteList[indexPath.row].favorites
        cell.favoriteImage?.sd_setImage(with: URL(string: viewModel.favoriteList[indexPath.item].favoriteImage ?? ""))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetail
        controller.movieLabelDetail?.text =  movieViewModel.movies[indexPath.item].movieLabelText
        present(controller, animated: true)
    }
}
