//
//  FilterCategoryCell.swift
//  MovieApp
//
//  Created by Fikrat on 25.10.22.
//

import UIKit

class FilterCategoryCell: UITableViewCell {

    @IBOutlet weak var filterCategoryTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell (data: String) {
        filterCategoryTitle.text = data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
