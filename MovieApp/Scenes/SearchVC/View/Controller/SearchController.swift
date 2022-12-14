//
//  SearchController.swift
//  MovieApp
//
//  Created by Fikrat on 18.10.22.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var collection: UICollectionView!
    
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSearch()
        textField.becomeFirstResponder()
        collection.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "HorizontalMovieCell")
        textFieldUI()
    }
    
    func textFieldUI() {
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
    }
    
    func configSearch() {
    viewModel.successCallback = {
        self.collection.reloadData()
    }
}
    
    @IBAction func searchText(_ sender: UITextField) {
        viewModel.searchMovies(text: sender.text ?? "")
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HorizontalMovieCell.self)", for: indexPath) as!
        HorizontalMovieCell
        cell.configCell(items: viewModel.item[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetailController.self)") as! MovieDetailController
        let item = viewModel.item[indexPath.item]
        controller.viewModel.id = item.movieId
        show(controller, sender: nil)
    }
}



