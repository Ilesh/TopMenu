//
//  UITabBarCustom.swift
//  chilax
//
//  Created by Tops on 6/27/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class UITabBarCustom: UITabBarController, UITabBarControllerDelegate {
    
    var lblShadowLine: UILabel?
    var btnTab1: UIButton?
    var btnTab2: UIButton?
    var btnTab3: UIButton?
    var btnTab4: UIButton?
    
    var floatTabAspRatio: CGFloat?
   
    
    // MARK: -  View Life Cycle Start Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideOriginalTabBar()
        self.addCustomElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -  Hide Original Add Custom elements Method
    func hideOriginalTabBar() {
        for view in self.tabBar.subviews {
            view.isHidden = true
        }
        
        for view in self.view.subviews {
            if view is UITabBar {
                view.isHidden = true
                view.removeFromSuperview()
                break;
            }
        }
    }
    
    func addCustomElements() {
        floatTabAspRatio = Global.screenWidth/CGFloat(320)
        self.removeAllOldElements()
    }
    
    func removeAllOldElements() {
        if (btnTab1 != nil) {
            btnTab1?.removeFromSuperview()
        }
        if (btnTab2 != nil) {
            btnTab2?.removeFromSuperview()
        }
        if (btnTab3 != nil) {
            btnTab3?.removeFromSuperview()
        }
        if (btnTab4 != nil) {
            btnTab4?.removeFromSuperview()
        }
        self.addAllElements()
    }
    
    func addAllElements() {
        lblShadowLine = UILabel(frame: CGRect(x: 0, y: Global.screenHeight - (42 * floatTabAspRatio!), width: Global.screenWidth, height: 1))
        lblShadowLine?.layer.shadowColor = UIColor.darkGray.cgColor
        lblShadowLine?.layer.shadowOpacity = 0.1
        lblShadowLine?.layer.shadowOffset = CGSize.zero
        lblShadowLine?.layer.shadowRadius = 1
        lblShadowLine?.layer.shadowPath = UIBezierPath(rect: (lblShadowLine?.bounds)!).cgPath
        self.view.addSubview(lblShadowLine!)
        
        btnTab1 = self.generateTabButton(0, isSelected: false)
        self.setShadow(to: btnTab1!)
        btnTab2 = self.generateTabButton(1, isSelected: false)
        self.setShadow(to: btnTab2!)
        btnTab3 = self.generateTabButton(2, isSelected: false)
        self.setShadow(to: btnTab3!)
        btnTab4 = self.generateTabButton(3, isSelected: true)
        self.setShadow(to: btnTab4!)
        
        self.view.addSubview(btnTab1!)
        self.view.addSubview(btnTab2!)
        self.view.addSubview(btnTab3!)
        self.view.addSubview(btnTab4!)
    
        
        btnTab1?.addTarget(self, action: #selector(UITabBarCustom.buttonClicked(_:)), for: .touchUpInside)
        btnTab1?.tag = 1
        btnTab2?.addTarget(self, action: #selector(UITabBarCustom.buttonClicked(_:)), for: .touchUpInside)
        btnTab2?.tag = 2
        btnTab3?.addTarget(self, action: #selector(UITabBarCustom.buttonClicked(_:)), for: .touchUpInside)
        btnTab3?.tag = 3
        btnTab4?.addTarget(self, action: #selector(UITabBarCustom.buttonClicked(_:)), for: .touchUpInside)
        btnTab4?.tag = 4
        let rect: CGRect = UIApplication.shared.statusBarFrame
        if (rect.size.height > 20) {
            self.changeFrameOfAllCustomElementForStatusBarHeightChange(2)
        }
    }

    func generateTabButton(_ intTag: Int, isSelected boolSel: Bool) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.tag = intTag
        btn.isSelected = boolSel
        btn.titleLabel?.font = UIFont(name: Global.kFont.QwallFont, size: Global.singleton.getDeviceSpecificFontSize(18))
        
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        btn.setTitleColor(UIColor.black, for: .selected)
        
        let tempY: CGFloat = Global.screenHeight - (42 * floatTabAspRatio!)
        let tempBtnHeight: CGFloat = 42 * floatTabAspRatio!
        let tempBtnWidth: CGFloat = Global.screenWidth / 4
 
        switch intTag {
        case 0: //Tab-1
            btn.setTitle("", for: .normal) // ADD
            btn.frame = CGRect(x: 0 + (tempBtnWidth * 0), y: tempY, width: tempBtnWidth, height: tempBtnHeight)
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(UIColor.black, for: .selected)
        case 1: //Tab-2
           
            btn.setTitle("", for: .normal) // List
            btn.frame = CGRect(x: 0 + (tempBtnWidth * 1), y: tempY, width: tempBtnWidth, height: tempBtnHeight)
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(UIColor.black, for: .selected)
        case 2: //Tab-3
          
            btn.setTitle("", for: .normal) //Camera
            btn.frame = CGRect(x: 0 + (tempBtnWidth * 2), y: tempY, width: tempBtnWidth, height: tempBtnHeight)
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(UIColor.black, for: .selected)
        case 3: //Tab-4

            btn.setTitle("", for: .normal) //Profile
            btn.frame = CGRect(x: 0 + (tempBtnWidth * 3), y: tempY, width: tempBtnWidth, height: tempBtnHeight)
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(UIColor.black, for: .selected)
        default:
            break
        }
        return btn;
    }
    
    // MARK: -  Button Click Methods
    @objc func buttonClicked (_ sender: UIButton) {
        switch sender.tag {
        case 1:
            self.selectTab(0)
        
        case 2:
            self.selectTab(1)
    
        case 3:
            self.selectTab(2)
            
        case 4:
            self.selectTab(3)
            
        default:
            break
        }
    }
    
    func setTabbaritemColor(index:Int, newcolorIndex:Int)
    {
        btnTab1?.isSelected = false
        btnTab2?.isSelected = false
        btnTab3?.isSelected = false
        btnTab4?.isSelected = false
        if index == 0
        {
            btnTab1?.isSelected = true
            btnTab1?.backgroundColor = UIColor.white
        }
        else if index == 1
        {
            btnTab2?.backgroundColor = UIColor.white
            btnTab2?.isSelected = true
        }
        else if index == 2
        {
            btnTab3?.backgroundColor = UIColor.white
            btnTab3?.isSelected = true
        }
        else{
            btnTab4?.backgroundColor = UIColor.white
            btnTab4?.isSelected = true
        }
    }
    
    // MARK: -  Tab bar selection
    func selectTab (_ intSelTabId: Int) {
        if (self.selectedIndex == intSelTabId) {
            let navController: UINavigationController = (self.selectedViewController as? UINavigationController)!
            navController.popToRootViewController(animated: true)
        }
        else {
            self.setTabbaritemColor(index: intSelTabId, newcolorIndex:intSelTabId)
            self.selectedIndex = intSelTabId
        }
    }
    
    // MARK: -  Hide Show Tabbar
    func showTabBar() {
        lblShadowLine?.isHidden = false
        btnTab1?.isHidden = false
        btnTab2?.isHidden = false
        btnTab3?.isHidden = false
        btnTab4?.isHidden = false
        
        btnTab1?.isUserInteractionEnabled = true
        btnTab2?.isUserInteractionEnabled = true
        btnTab3?.isUserInteractionEnabled = true
        btnTab4?.isUserInteractionEnabled = true
    }
    
    func hideTabBar() {
        lblShadowLine?.isHidden = true
        btnTab1?.isHidden = true
        btnTab2?.isHidden = true
        btnTab3?.isHidden = true
        btnTab4?.isHidden = true
        
        btnTab1?.isUserInteractionEnabled = false
        btnTab2?.isUserInteractionEnabled = false
        btnTab3?.isUserInteractionEnabled = false
        btnTab4?.isUserInteractionEnabled = false
    }
    
    func changeFrameOfAllCustomElementForStatusBarHeightChange(_ flag:Int) {
        var tempIncDec: CGFloat = 0;
        if (flag == 1) {
            tempIncDec = 20
        }
        else if (flag == 2) {
            tempIncDec = -20;
        }
        
        self.btnTab1?.frame = CGRect(x: btnTab1!.frame.origin.x, y: btnTab1!.frame.origin.y + tempIncDec, width: self.btnTab1!.frame.size.width, height: self.btnTab1!.frame.size.height)
        self.btnTab1?.backgroundColor = UIColor.white
        
        self.btnTab2?.frame = CGRect(x: btnTab2!.frame.origin.x, y: btnTab2!.frame.origin.y + tempIncDec, width: self.btnTab2!.frame.size.width, height: self.btnTab2!.frame.size.height)
        self.btnTab2?.backgroundColor = UIColor.white
        
        self.btnTab3?.frame = CGRect(x: btnTab3!.frame.origin.x, y: btnTab3!.frame.origin.y + tempIncDec, width: self.btnTab3!.frame.size.width, height: self.btnTab3!.frame.size.height)
        self.btnTab3?.backgroundColor = UIColor.white
        
        self.btnTab4?.frame = CGRect(x: btnTab4!.frame.origin.x, y: btnTab4!.frame.origin.y + tempIncDec, width: self.btnTab4!.frame.size.width, height: self.btnTab4!.frame.size.height)
        self.btnTab4?.backgroundColor = UIColor.white
    }
    
    func setShadow(to view:UIView) {
        //let shadowSize : CGFloat = 2.0
        //view.layer.frame = view.bounds
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        view.layer.shadowOpacity = 0.5
        //view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
}
