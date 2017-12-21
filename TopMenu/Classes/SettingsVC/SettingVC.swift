//
//  SettingVC.swift
//  RAVAS
//
//  Created by Tops on 12/14/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var btnMenu: IPAutoScalingButton!
    @IBOutlet weak var lblSettings: IPAutoScalingLabel!

    //MARK:-  VIEW METHODS STARTS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- BUTTON ACTION METHODS
    @IBAction func btnMenuClick(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        self.view.endEditing(true)
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: false)
        Global.appDelegate.viewMenuClick?.delegate = self
    }
    
    @IBAction func sgmChangeValue(_ sender: Any) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension SettingVC : TopMenuDelegate {
 
    func didHide() {
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: true)
    }
    
    func didSelectMenu(index: String) {
        Global.appDelegate.showMenuViewWithCompletion(viewMain: self.view, isShow: true) {
            Global.appDelegate.MenuclickWithCompletion(index: index)
        }
        
    } 
}


