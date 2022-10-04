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
    
    func genreConfigure (item: MovieCategoryGenreCellProtocol){
//        genreLabel.text = "\(item.genreLabelText ?? 0)"
    }
    
    func genreLayout(){
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
    }

}
