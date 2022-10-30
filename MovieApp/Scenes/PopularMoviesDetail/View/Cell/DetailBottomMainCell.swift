//
//  DetailBottomMainCell.swift
//  MovieApp
//
//  Created by Fikrat on 19.10.22.
//

import UIKit

class DetailBottomMainCell: UICollectionViewCell {
    
    @IBOutlet private weak var detailBottomCollection: UICollectionView!
    @IBOutlet private weak var bottomTitleLabel: UILabel!
    
    var viewModel = CastViewModel()
    var castListModel = [Cast]()
    var similiarListModel = [SimilarResults]()
    var items = [CellProtocol]()
    
    var castCallBack: (() -> ())?
    var similiarCallBack: (() -> ())?
  
    func configure(data: [CellProtocol], title: String) {
        items = data
        bottomTitleLabel.text = title
        detailBottomCollection.register(UINib(nibName: "\(MovieDetailBottomCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieDetailBottomCell")
        detailBottomCollection.reloadData()
    }
}

extension DetailBottomMainCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieDetailBottomCell.self)", for: indexPath) as! MovieDetailBottomCell
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 72 / 327, height: collectionView.frame.height)
    }
}
