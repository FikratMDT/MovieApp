//
//  OverViewCell.swift
//  MovieApp
//
//  Created by Fikrat on 28.08.22.
//

import UIKit

protocol OverViewCellProtocol {
    var titleLabelText: String? {get}
    var subtitleLabelText: String? {get}
}

class OverViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
