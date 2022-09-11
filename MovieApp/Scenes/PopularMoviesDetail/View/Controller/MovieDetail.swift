//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

class MovieDetail: UIViewController {
    
    @IBOutlet weak var movieImageDetail: UIImageView!
    @IBOutlet weak var movieLabelDetail: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    //    var movieId = 0
    var movieDetail: MovieDetailList?
    var index: ((Int) -> ())?
    
    var viewModel = MovieDetailViewModel()
    
//    init(id: Int) {
//        viewModel = MovieDetailViewModel(id: id)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.layer.borderColor = UIColor.gray.cgColor
        collection.layer.borderWidth = 5
        
        viewModel.getMovie {
            self.configUI()
        }
    }
    
    fileprivate func configUI() {
        movieLabelDetail?.text = viewModel.movieDetail?.title
        movieImageDetail.sd_setImage(with: URL(string: movieDetail?.posterPath ?? "" ))
        collection.reloadData()
    }
}

extension MovieDetail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverViewCell", for: indexPath) as! OverViewCell
        cell.titleLabel.text = viewModel.movieDetail?.originalTitle
        cell.subtitleLabel.text = viewModel.movieDetail?.overview
        return cell
    }
}

extension MovieDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieDetail?.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
        cell.genreLabel.text = viewModel.movieDetail?.genres?[indexPath.item].name ?? ""
        return cell
    }
}
