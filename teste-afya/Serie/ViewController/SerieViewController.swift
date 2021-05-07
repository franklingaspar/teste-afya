//
//  SerieViewController.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation
import UIKit

class SerieViewController: BaseViewController {
    
    var serie: Show?
    var myView: SerieView?
    
    override func loadView() {
        super.loadView()
        myView = SerieView()
        
        self.view = myView
    }
    
    override func viewDidLoad() {
        self.title = serie?.name
        self.setDefaultColorNavBar()
        myView?.serie = serie
    }

}
