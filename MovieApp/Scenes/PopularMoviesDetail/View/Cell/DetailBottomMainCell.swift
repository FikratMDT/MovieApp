//
//  DetailBottomMainCell.swift
//  MovieApp
//
//  Created by Fikrat on 19.10.22.
//

import UIKit

class DetailBottomMainCell: UICollectionViewCell {
    
    var viewModel = CastViewModel()
    var castListModel = [Cast]()
    var similiarListModel = [SimiliarResults]()

    @IBOutlet private weak var detailBottomCollection: UICollectionView!
    @IBOutlet private weak var bottomTitleLabel: UILabel!
  
    
    
    func configCastCell(data: [Cast]?) {
        
        if let data = data {
            castListModel = data
            detailBottomCollection.register(UINib(nibName: "\(MovieDetailBottomCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieDetailBottomCell")
            bottomTitleLabel.text = "Cast"
            detailBottomCollection.reloadData()
        }
    }
    
    func configSimiliarCell (data: [SimiliarResults]?) {
        if let data = data {
            similiarListModel = data
            detailBottomCollection.register(UINib(nibName: "\(MovieDetailBottomCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieDetailBottomCell")
            bottomTitleLabel.text = "Similiar Movies"
            detailBottomCollection.reloadData()
        }
    }
}

extension DetailBottomMainCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.numberOfSections == 0 {
            similiarListModel.count
        } else {
        }
        return castListModel.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieDetailBottomCell.self)", for: indexPath) as! MovieDetailBottomCell
        
        
        
//        cell.castConfigure(items: castListModel[indexPath.row])
        

        
        if indexPath.section == 0 {
            cell.similiarConfigure(items: similiarListModel[indexPath.row])
          } else {
              cell.castConfigure(items: castListModel[indexPath.row])
          }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width * 72 / 327, height: collectionView.frame.height)
    }
}
