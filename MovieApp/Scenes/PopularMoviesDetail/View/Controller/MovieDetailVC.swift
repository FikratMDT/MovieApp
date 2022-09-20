//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

protocol MovieDetailProtocol{
    var movieLabelDetailText: String? {get}
    var movieLabelImageView: String? {get}
    var releaseDateLabelText: String? {get}
    var movieVote: Double? {get}
}

class MovieDetailVC: UIViewController {
    
    @IBOutlet private weak var scroll: UIScrollView!
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var movieImageDetail: UIImageView!
    @IBOutlet private  weak var movieLabelDetail: UILabel!
    @IBOutlet private  weak var releaseDateLabel: UILabel!
    @IBOutlet private  weak var voteLabel: UILabel!
    
    var movieDetail: MovieDetailList?
    var index: ((Int) -> ())?
    var viewModel = MovieDetailViewModel()
//    var trailerViewModel = MovieTrailerViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovie {
            self.configUI()
        }
    }
    
//    func configure(items: MovieDetailProtocol ) {
//        movieLabelDetail.text = items.movieLabelDetailText
//        movieImageDetail.sd_setImage(with: URL(string: items.movieLabelImageView ?? ""))
//        releaseDateLabel.text = items.releaseDateLabelText
//        voteLabel.text = "\(items.movieVote ?? 0.0)"
//    }

    
    fileprivate func configUI() {
        movieLabelDetail?.text = viewModel.movieDetail?.movieLabelDetailText
        movieImageDetail.sd_setImage(with: URL(string: viewModel.movieDetail?.movieLabelImageView ?? "" ))
        releaseDateLabel?.text = viewModel.movieDetail?.releaseDateLabelText
        voteLabel.text = "\(viewModel.movieDetail?.movieVote ?? 0.0)"
        collection.reloadData()
    }
    
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieTrailerVC.self)") as! MovieTrailerVC
        controller.trailerViewModel.id = viewModel.movieDetail?.id ?? 0
        present(controller, animated: true)
    }
    
}

extension MovieDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OverViewCell", for: indexPath) as! OverViewCell
        cell.titleLabel.text = viewModel.movieDetail?.titleLabelText
        cell.subtitleLabel.text = viewModel.movieDetail?.subtitleLabelText
        return cell
    }
}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieDetail?.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCell
        cell.configureCell(title: viewModel.movieDetail?.genres?[indexPath.row].name ?? "")
        return cell
    }
}
