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
    
    //MARK: livecycler
    override func loadView() {
        super.loadView()
        myView = HomeView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        self.title = "Home"
        self.setColorNavBar(.colorByHexDecimal(hex: ConstantsColor.pink))
        
        AfyaApi.allSeries(completionHandler: { result in
            switch result {
            case.success(let series):
                print(series)
            case .error(let error):
                print(error)
            }
        })
        
    }
    
}
