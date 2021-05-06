//
//  UIColor.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation
import UIKit


extension UIColor {
    
    // Função para uso de HExcolors no iOS
    class func colorByHexDecimal(hex: String, alpha: CGFloat = 1) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (!cString.isEmpty && cString.count != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
    
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
