//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

//protocol MovieDetailProtocol{
//    var movieLabelDetailText: String? {get}
//    var movieLabelImageView: String? {get}
//    var releaseDateLabelText: String? {get}
//    var movieVote: Double? {get}
//}

class MovieDetailController: UIViewController {
    
    @IBOutlet private weak var scroll: UIScrollView!
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var movieImageDetail: UIImageView!
    @IBOutlet weak var movieLabelDetail: UILabel!
    @IBOutlet private  weak var releaseDateLabel: UILabel!
    @IBOutlet private  weak var voteLabel: UILabel!
    
    var movieDetail: MovieDetailList?
    var index: ((Int) -> ())?
    var viewModel = MovieDetailViewModel()
    var castViewModel = CastViewModel()
    var similiarViewModel = SimilarViewModel()
//    var trailerViewModel = MovieTrailerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configDetailScreen()
    }
    
    fileprivate func configDetailScreen() {
        
        collection.register(UINib(nibName: "\(MovieDetailCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieDetailCell")
        
        collection.register(UINib(nibName: "\(MovieDetailHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeader.self)")
        
        viewModel.getMovie {
        }
        
        viewModel.successCallback = {
            self.collection.reloadData()
        }
        
        castViewModel.getCast(id: viewModel.id) { [weak self] items in
            self?.viewModel.items.append(MovieDetailListItem(item: items, title: "Cast", type: .cast))
        }
        
        castViewModel.successCallback = {
            self.collection.reloadData()
        }
        
        similiarViewModel.successCallback = {
            self.collection.reloadData()
        }
        
        similiarViewModel.getSimiliar(id: viewModel.id) { [weak self] items in
            if let items = items {
                self?.viewModel.items.append(MovieDetailListItem(item: items, title: "Similar Movies", type: .similarMovies))
            }
        }
    }
}

extension MovieDetailController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieDetailCell.self)", for: indexPath) as! MovieDetailCell
        
        cell.configure(data: viewModel.items[indexPath.item].item as! [CellProtocol], title: viewModel.items[indexPath.item].title)
        
        return cell
    }   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeader.self)", for: indexPath) as! MovieDetailHeader
        header.configureDetailHeader(id: viewModel.movieDetail?.id ?? 0, data: viewModel.movieDetail)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 200)
    }
}


//extension MovieDetailVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "OverViewCell", for: indexPath) as! OverViewCell
//        cell.titleLabel.text = viewModel.movieDetail?.titleLabelText
//        cell.subtitleLabel.text = viewModel.movieDetail?.subtitleLabelText
//        return cell
//    }
//}
//
//extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.movieDetail?.genres?.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
//        cell.configureCell(title: viewModel.movieDetail?.genres?[indexPath.row].name ?? "")
//        return cell
//    }
//}

//}
