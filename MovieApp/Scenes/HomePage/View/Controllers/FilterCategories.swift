//
//  FilterCategories.swift
//  MovieApp
//
//  Created by Fikrat on 25.10.22.
//

import UIKit

enum FilterCategoriesListItemType: String {
    case popular
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
}

struct FilterCategoriesListItem {
    var title: String
    var type: FilterCategoriesListItemType
}

class FilterCategories: UIViewController {

    var item = [FilterCategoriesListItem(title: "Popular", type: .popular),
                FilterCategoriesListItem(title: "Upcoming", type: .upcoming),
                FilterCategoriesListItem(title: "Now Playing", type: .nowPlaying),
                FilterCategoriesListItem(title: "Top rated", type: .topRated)]
    
    @IBOutlet weak var table: UITableView!
    var callBack: ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UINib(nibName: "\(FilterCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "FilterCategoryCell")
    }
}

extension FilterCategories: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FilterCategoryCell.self)") as! FilterCategoryCell
        cell.filterCategoryTitle.text = item[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callBack?(item[indexPath.row].type.rawValue)
        dismiss(animated: true)
    }
}
