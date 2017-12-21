//
//  UITextField+Paddingview.swift
//  Lyst
//
//  Created by Tops on 3/16/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    /**
     @brief This is normal padding methods
     @param no need paramer (it's contain default parameter )
     * UITextField = textfield which you want to set left padding
     * padding = 0.5
     `````
     txtEmail.paddingview(txtEmail)
     `````
     @remark This is super easy methods
     
     */
    func paddingview(_ txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.always
        return txtfield
    }
    
    /**
     @brief This is large padding methods
     @param no need paramer (it's contain default parameter )
     * UITextField = textfield which you want to set left padding
     * padding = 40
     `````
     txtEmail.paddingviewLarge(txtEmail)
     `````
     @remark This is super easy methods
     
     */
    func paddingviewLarge(_ txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRect(x: 0, y: 0,width: 40, height: txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.always
        return txtfield
    }
    func paddingviewRight(_ txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRect(x: 0, y: 0,width: 40, height: txtfield.frame.height))
        txtfield.rightView = l3
        txtfield.rightViewMode = UITextFieldViewMode.always
        return txtfield
    }
    func paddingviewMedium(_ txtfield:UITextField)-> UITextField{
        let l3 = UIView(frame: CGRect(x: 0, y: 0,width: 20, height: txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.always
        return txtfield
    }
    func paddingviewWithCustomValue(_ value:CGFloat,txtfield:UITextField){
        let l3 = UIView(frame: CGRect(x: 0, y: 0,width: value, height: txtfield.frame.height))
        txtfield.leftView = l3
        txtfield.leftViewMode = UITextFieldViewMode.always
    }
    func paddingviewRightWithCustomValue(_ value:CGFloat,txtfield:UITextField){
        let l3 = UIView(frame: CGRect(x: 0, y: 0,width: value, height: txtfield.frame.height))
        txtfield.rightView = l3
        txtfield.rightViewMode = UITextFieldViewMode.always
    }
    func DrawTextUnderline(_ lineHeight:CGFloat, lineColor:UIColor, lineWidth: CGFloat) {
        let border = CALayer()
        border.borderColor = lineColor.cgColor
        border.frame = CGRect(x: CGFloat(0), y: CGFloat(self.frame.size.height - lineHeight), width: CGFloat(lineWidth), height: CGFloat(lineHeight))
        border.borderWidth = lineHeight
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func DrawTextTopline(_ lineHeight:CGFloat, lineColor:UIColor, lineWidth: CGFloat) {
        let border = CALayer()
        border.borderColor = lineColor.cgColor
        border.frame = CGRect(x: CGFloat(0), y:CGFloat(0), width: CGFloat(lineWidth), height: CGFloat(lineHeight))
        border.borderWidth = lineHeight
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    
}

