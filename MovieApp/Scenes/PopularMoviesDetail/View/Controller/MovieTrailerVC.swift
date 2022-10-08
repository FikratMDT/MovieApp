//
//  MovieTrailerVC.swift
//  MovieApp
//
//  Created by Fikrat on 19.09.22.
//

import UIKit
import WebKit

class MovieTrailerVC: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var movieTrailerView: WKWebView!
    
    var trailerViewModel = MovieTrailerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailerViewModel.getMovieTrailer {
            if let url = URL(string:
                                "https://www.youtube.com/watch?v=\(self.trailerViewModel.trailerModel?.results?.first?.key ?? "")") {
                self.movieTrailerView?.load(URLRequest(url: url))
                self.movieTrailerView?.allowsBackForwardNavigationGestures = true
            }
        }
    }
}
