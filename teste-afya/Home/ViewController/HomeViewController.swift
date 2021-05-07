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
        self.title = "Home"
        self.setColorNavBar(.colorByHexDecimal(hex: ConstantsColor.pink))
        homeViewModel = HomeViewModel()
        homeViewModel?.delegate = self
        showLoad()
        homeViewModel?.getListSeries(pagina: pagina )
        myView?.delegate = self
        setPagina()
    }
    
    private func setPagina() {
        myView?.paginas = pagina
    }
    
}

extension HomeViewController: HomeViewModelProtocool {
    func listSeries(series: [Show]) {
        myView?.listSeries = series
        hideLoad()
    }
}

extension HomeViewController: HomeViewProtocool {
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
