//
//  UIViewController.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setDefaultColorNavBar(){
        self.navigationController!.navigationBar.backgroundColor = .colorByHexDecimal(hex: ConstantsColor.pink)
        setColorNavBarText(color: ConstantsColor.white)
    }
    
    func setColorNavBarText(color: String) {
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.colorByHexDecimal(hex: color)]
    }
    
    func setColorNavBar(_ color: UIColor) {
        self.navigationController!.navigationBar.backgroundColor = color
    }
    
}
