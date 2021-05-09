//
//  HomeViewController.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: variable
    var myView: HomeView?
    var homeViewModel: HomeViewModel?
    var pagina = 1
    
    //MARK: livecycler
    override func loadView() {
        super.loadView()
        myView = HomeView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        self.setDefaultColorNavBar()
        homeViewModel = HomeViewModel()
        homeViewModel?.delegate = self
        showLoad()
        homeViewModel?.getListSeries(pagina: pagina )
        myView?.delegate = self
        
        myView?.searchBarController.delegate = self
        myView?.searchBarController.searchResultsUpdater = self
        
        self.navigationItem.titleView = myView?.searchBarController.searchBar
        self.definesPresentationContext = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
    
        setPagina()
    }
    
    private func setPagina() {
        myView?.paginas = pagina
    }
    
    private func goToSeriViewController(_ serie: Show) {
        let vc = SerieViewController()
        vc.serie = serie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: HomeViewModelProtocool {
    func listSearch(list: [Search]) {
        CustomSearch().showCustomSearch(list: list, on: self, completionHandler: { serie in
            self.goToSeriViewController(serie)
        })
    }
    
    func listSeries(series: [Show]) {
        myView?.listSeries = series
        hideLoad()
    }
}

extension HomeViewController: HomeViewProtocool {
    func clickSerie(serie: Show) {
        goToSeriViewController(serie)
    }
    
    func clickNext() {
        showLoad()
        pagina = pagina + 1
        homeViewModel?.getListSeries(pagina: pagina)
        setPagina()
    }
    
    func clickPrevius() {
        showLoad()
        pagina = pagina - 1
        homeViewModel?.getListSeries(pagina: pagina)
        setPagina()
        
    }
}

extension HomeViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text != "" {
            homeViewModel?.geListSearch(name: searchController.searchBar.text!)
        }
    
        
    }
    
}
