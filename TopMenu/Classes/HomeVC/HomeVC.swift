//
//  HomeVC.swift
//  RAVAS
//
//  Created by Tops on 12/14/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit
typealias buttonHandler = (_ Finish : Bool) -> Void
class HomeVC: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK:- BUTTON ACTION METHODS
    @IBAction func btnMenuClick(_ sender: Any) {
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: false)
        Global.appDelegate.viewMenuClick?.delegate = self
    }
    
    @IBAction func btnRavasClick(_ sender:AnyObject){
        
    }
    
    @IBAction func btnSlaveClick(_ sender:AnyObject){
        
    }
    
    @IBAction func btnIndicatorClick(_ sender:AnyObject){
        
    }
}
extension HomeVC : TopMenuDelegate {
    
    func didHide() {
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: true)
    }
    
    func didSelectMenu(index: String) {
        Global.appDelegate.showMenuViewWithCompletion(viewMain: self.view, isShow: true) {
            Global.appDelegate.MenuclickWithCompletion(index: index)
        }
    }
}

