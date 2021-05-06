//
//  BaseViewController.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    private let loadSpinner = Spinner()
    
    func showLoad() {
        self.addChild(loadSpinner)
        loadSpinner.view.frame = view.frame
        self.view.addSubview(loadSpinner.view)
        loadSpinner.didMove(toParent: self)
    }

    func hideLoad(){
        DispatchQueue.main.async {
            self.loadSpinner.willMove(toParent: nil)
            self.loadSpinner.view.removeFromSuperview()
            self.loadSpinner.removeFromParent()
        }
    }
    
}
