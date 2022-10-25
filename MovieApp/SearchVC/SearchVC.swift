//
//  SearchVC.swift
//  MovieApp
//
//  Created by Fikrat on 18.10.22.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func searchTextField(_ sender: UITextField) {
        viewModel.searchMovies(text: sender.text ?? "")
        print("test")
        textField.resignFirstResponder()
        
    }
}
