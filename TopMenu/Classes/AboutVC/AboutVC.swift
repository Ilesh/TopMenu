//
//  AboutVC.swift
//  RAVAS
//
//  Created by Tops on 12/14/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UITextViewDelegate,TopMenuDelegate {
    
    @IBOutlet weak var lblAbout: IPAutoScalingLabel!
    @IBOutlet weak var btnMenu: IPAutoScalingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func viewsSetup(view:UIView) -> Void {
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        
    }
    //MARK:- BUTTON ACTION METHODS
    @IBAction func btnMenuClick(_ sender: Any) {
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: false)
        Global.appDelegate.viewMenuClick?.delegate = self
    }

    func didHide() {
        Global.appDelegate.showMenuView(viewMain: self.view, isShow: true)
    }
    
    func didSelectMenu(index: String) {
        Global.appDelegate.showMenuViewWithCompletion(viewMain: self.view, isShow: true) {
            Global.appDelegate.MenuclickWithCompletion(index: index)
        }
    }
}
