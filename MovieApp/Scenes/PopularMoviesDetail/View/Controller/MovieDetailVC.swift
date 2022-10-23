//
//  MovieDetailVC.swift
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

class MovieDetailVC: UIViewController {
    
    @IBOutlet private weak var scroll: UIScrollView!
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var movieImageDetail: UIImageView!
    @IBOutlet private  weak var movieLabelDetail: UILabel!
    @IBOutlet private  weak var releaseDateLabel: UILabel!
    @IBOutlet private  weak var voteLabel: UILabel!
    
//    @IBAction func testButton(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetVc.self)") as! MovieDetVc
//        
//    }
    var movieDetail: MovieDetailList?
    var index: ((Int) -> ())?
    var viewModel = MovieDetailViewModel()
    var castViewModel = CastViewModel()
    var similiarViewModel = SimiliarViewModel()
//    var trailerViewModel = MovieTrailerViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: "\(DetailBottomMainCell.self)", bundle: nil), forCellWithReuseIdentifier: "DetailBottomMainCell")
        
        
        collection.register(UINib(nibName: "\(MovieDetailHeaderVC.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeaderVC.self)")
        
        viewModel.getMovie {
//            self.configUI()
            self.collection.reloadData()
        }
        
        castViewModel.id = viewModel.id
        castViewModel.getCast {
            self.collection.reloadData()
        }
    }
    
    
//    func configure(items: MovieDetailProtocol ) {
//        movieLabelDetail.text = items.movieLabelDetailText
//        movieImageDetail.sd_setImage(with: URL(string: items.movieLabelImageView ?? ""))
//        releaseDateLabel.text = items.releaseDateLabelText
//        voteLabel.text = "\(items.movieVote ?? 0.0)"
//    }
//
//    
//    fileprivate func configUI() {
//        movieLabelDetail?.text = viewModel.movieDetail?.movieLabelDetailText
////        movieImageDetail.sd_setImage(with: URL(string: viewModel.movieDetail?.movieLabelImageView ?? "" ))
//        releaseDateLabel?.text = viewModel.movieDetail?.releaseDateLabelText
//        voteLabel.text = "\(viewModel.movieDetail?.movieVote ?? 0.0)"
//        collection.reloadData()
//    }
    
    
//    @IBAction func playButtonTapped(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieTrailerVC.self)") as! MovieTrailerVC
//        controller.trailerViewModel.id = viewModel.movieDetail?.id ?? 0
//        present(controller, animated: true)
//    }
    
}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailBottomMainCell.self)", for: indexPath) as! DetailBottomMainCell
        
        
        if indexPath.row == 0 {
            cell.configSimiliarCell(data: similiarViewModel.similiarList?.similiarResults)
          } else {
              cell.configCastCell(data: castViewModel.castList?.cast)
          }
//        cell.configCastCell(data: castViewModel.castList?.cast)

        return cell
    }
    
//    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if (data.kind == kind1) {
//            let cell1 = collectionView.dequeueReusableCell..  as! kind1
//
//            return cell1
//        } else {
//            let cell2 = collectionView.dequeueReusableCell.. as! kind2
//
//            return cell2
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collection.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(MovieDetailHeaderVC.self)", for: indexPath) as! MovieDetailHeaderVC
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
//
//}
