//
//  UILabel.swift
//  teste-afya
//
//  Created by Magna on 07/05/21.
//

import Foundation
import UIKit

extension UILabel {
    class func labelDefault(color: UIColor, font: CGFloat, numberOfLines: Int, textAlignment: NSTextAlignment, bold: Bool) -> UILabel {
        let view = UILabel()
        view.textColor = color
        view.numberOfLines = numberOfLines
        view.textAlignment = textAlignment
        if bold {
            view.font = UIFont.boldSystemFont(ofSize: font)
        } else {
            view.font = UIFont.systemFont(ofSize: font, weight: UIFont.Weight.medium)
        }
        
        return view
    }
    
    class func makeBigText(title: String) -> UILabel {
        let label = UILabel.labelDefault(color: .colorByHexDecimal(hex: ConstantsColor.black ), font: 20, numberOfLines: 0, textAlignment: .left, bold: false)
        label.text = title
        return label
    }
    
    class func makeMediumText(title: String) -> UILabel {
        let label = UILabel.labelDefault(color: .colorByHexDecimal(hex: ConstantsColor.black ), font: 16, numberOfLines: 0, textAlignment: .left, bold: false)
        label.text = title
        return label
    }
    
    class func makeSmallText(title: String) -> UILabel {
        let label = UILabel.labelDefault(color: .colorByHexDecimal(hex: ConstantsColor.black ), font: 12, numberOfLines: 0, textAlignment: .left, bold: false)
        label.text = title
        return label
    }
}
