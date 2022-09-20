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

    @IBOutlet  weak var titleLabel: UILabel!
    @IBOutlet  weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
