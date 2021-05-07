//
//  HomeViewModel.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation

protocol HomeViewModelProtocool {
    func listSeries(series: [Show])
}

class HomeViewModel {
    
    var delegate: HomeViewModelProtocool?
    
    func getListSeries(pagina: Int) {
        AfyaApi.allSeries(pagina: pagina, completionHandler: { result in
            switch result {
            case.success(let series):
                self.delegate?.listSeries(series: series)
            case .error(let error):
                print(error)
            }
        })
    }
    
}
