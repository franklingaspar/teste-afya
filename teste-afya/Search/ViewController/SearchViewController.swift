//
//  SearchTableViewController.swift
//  teste-afya
//
//  Created by Magna on 10/05/21.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    //MARK: variables
    var listSearch = [Search]() {
        didSet {
            myView?.listSearch = listSearch
            myView?.tableView.reloadData()
        }
    }
    
    //MARK: views
    var myView: SearchView?
    var navigationViewController: UINavigationController?
    
    //MARK: live cycle
    override func loadView() {
        super.loadView()
        myView = SearchView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        myView?.delegate = self
    }
}

extension SearchViewController: SearchViewProtocool {
    func clickSerie(serie: Show) {
        let vc = SerieViewController()
        vc.serie = serie
        self.navigationViewController?.pushViewController(vc, animated: true)
    }
    
}
