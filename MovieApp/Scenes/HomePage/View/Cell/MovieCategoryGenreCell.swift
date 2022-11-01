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

protocol MovieCategoryGenreCellProtocolDetailVC {
    var genreLabelText: String { get }
}

class MovieCategoryGenreCell: UICollectionViewCell {

    @IBOutlet  weak var genreLabel: UILabel!
    
    override func layoutSubviews() {
        genreLayout()
    }
    
    func genreConfigure (item: String, id: Int? = nil) {
        genreLabel.text = item
    }
    
    func genreConfigDetailVC(item: MovieCategoryGenreCellProtocolDetailVC) {
        genreLabel.text = item.genreLabelText
    }
    
    func genreLayout() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.6
    }
}
