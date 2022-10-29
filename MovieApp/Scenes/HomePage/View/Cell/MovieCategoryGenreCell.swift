//
//  MovieCategoryGenreCell.swift
//  MovieApp
//
//  Created by Fikrat on 01.10.22.
//

import UIKit

protocol MovieCategoryGenreCellProtocol {
    var genreLabelText: [Int] {get}
}

class MovieCategoryGenreCell: UICollectionViewCell {

    @IBOutlet private weak var genreLabel: UILabel!
    
    override func layoutSubviews() {
        genreLayout()
    }
    
    func genreConfigure (item: String, id: Int? = nil) {
        genreLabel.text = item
    }
    
    func genreLayout() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.6
    }

}
