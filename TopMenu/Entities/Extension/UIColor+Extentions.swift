//
//  UIColor+Extentions.swift
//  Humati
//
//  Created by Tops on 10/3/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: Int, alpha: CGFloat) {
        let r = CGFloat((rgb & 0xFF0000) >> 16)/255
        let g = CGFloat((rgb & 0xFF00) >> 8)/255
        let b = CGFloat(rgb & 0xFF)/255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    convenience init(netHex: Int) {
        self.init(rgb:netHex, alpha:1.0)
    }
    
    convenience init(hex: String) {
        var cString : String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")){
            let index = cString.index(cString.startIndex, offsetBy: 1)
            cString = cString.substring(from: index)
            
        }
        let scanner = Scanner(string: cString)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
