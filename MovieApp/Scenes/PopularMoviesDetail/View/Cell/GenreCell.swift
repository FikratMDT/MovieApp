//
//  GenreCell.swift
//  MovieApp
//
//  Created by Fikrat on 28.08.22.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    @IBOutlet private weak var genreLabel: UILabel!
    
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
    }
    
    public func configureCell(title:String) {
        genreLabel.text = title
    }
}
