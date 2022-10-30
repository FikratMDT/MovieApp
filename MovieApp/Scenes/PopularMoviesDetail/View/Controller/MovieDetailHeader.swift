//
//  MovieDetailHeader.swift
//  MovieApp
//
//  Created by Fikrat on 10.10.22.
//

import UIKit
import WebKit

class MovieDetailHeader: UICollectionReusableView {

    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var imdbLabel: UILabel!
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var overViewLabel: UILabel!
    @IBOutlet private weak var detailMovieTitle: UILabel!
    @IBOutlet private weak var collection: UICollectionView!

    var movieDetail: MovieDetailList?
    var viewModel = MovieDetailViewModel()
    var trailerViewModel = MovieTrailerViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        view.roundCorners(corners: [.topLeft, .topRight], radius: 8.0)
        configureWebView()
        collection.register(UINib(nibName: "\(MovieCategoryGenreCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieCategoryGenreCell")
    }
    
    func configureDetailHeader(id: Int, data: MovieDetailList?) {
        
        if let data = data {
            configHeaderUI(data: data)
        }
        movieDetail = data
        trailerViewModel.id = id
        configureWebView()
        viewModel.successCallback = {
            self.collection.reloadData()
        }
    }
    
    private func configHeaderUI (data: MovieDetailList) {
        detailMovieTitle.text = data.originalTitle
        overViewLabel.text = data.overview
        imdbLabel?.text = "\(String(format: "%.1f", data.voteAverage ?? 0.0))/10 IMDb"
    }
    
   fileprivate func configureWebView() {
        trailerViewModel.getMovieTrailer {
            if let url = URL(string:
                                "https://www.youtube.com/watch?v=\(self.trailerViewModel.trailerModel?.results?.first?.key ?? "")") {
                self.webView?.load(URLRequest(url: url))
                self.webView?.allowsBackForwardNavigationGestures = true
            }
        }
       
        trailerViewModel.successCallback = {
        }
    }
}

extension MovieDetailHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieDetail?.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(MovieCategoryGenreCell.self)", for: indexPath) as! MovieCategoryGenreCell
        cell.genreConfigure(item: movieDetail?.genres?[indexPath.row].name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionView.frame.height)
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
