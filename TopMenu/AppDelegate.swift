//
//  AppDelegate.swift
//  QWALL
//
//  Created by Tops on 12/4/17.
//  Copyright © 2017 Tops. All rights reserved.
//
import UIKit
//import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController:UINavigationController?
    var viewMenuClick:TopMenuVC?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //IQKeyboardManager.sharedManager().enable = true
        let homeObj = HomeVC(nibName: "HomeVC", bundle: nil)
        navController = UINavigationController(rootViewController: homeObj)
        navController?.isNavigationBarHidden = true
        window?.rootViewController = navController
        /*viewMenuClick = Bundle.main.loadNibNamed("TopMenuVC", owner: self, options: nil)?.first as? TopMenuVC
        viewMenuClick?.frame.size.width = UIScreen.main.bounds.size.width
        viewMenuClick?.frame.size.height = 350
        viewMenuClick?.frame.origin.y = CGFloat(-350)
        self.window?.addSubview(viewMenuClick!)*/
        window?.makeKeyAndVisible()
        return true
    }
    
    func showMenuViewWithCompletion(viewMain:UIView,isShow:Bool,completion: @escaping() -> ()) {
        if viewMenuClick == nil {
            viewMenuClick = Bundle.main.loadNibNamed("TopMenuVC", owner: self, options: nil)?.first as? TopMenuVC
            viewMenuClick?.frame.size.width = UIScreen.main.bounds.size.width
            viewMenuClick?.frame.size.height = CGFloat(Global.menuHeight) // 350
            viewMenuClick?.frame.origin.y = CGFloat(-Global.menuHeight)
            self.window?.addSubview(viewMenuClick!)
        }
        viewMain.bringSubview(toFront: viewMenuClick!)
        Global().delay(delay: 0.1) {
            UIView.animate(withDuration: 0.4, animations: {
                if self.viewMenuClick?.frame.origin.y != 0 {
                    self.viewMenuClick?.frame.origin.y = 0
                    viewMain.frame.origin.y = CGFloat(Global.menuHeight)
                    self.viewMenuClick?.snapshot =  viewMain.snapshotView(afterScreenUpdates: true)
                    viewMain.addSubview((self.viewMenuClick?.snapshot)!)
                }else{
                    self.viewMenuClick?.frame.origin.y = CGFloat(-Global.menuHeight)
                    viewMain.frame.origin.y = 0
                    self.viewMenuClick?.snapshot?.removeFromSuperview()
                }
                self.viewMenuClick?.layoutIfNeeded()
                viewMain.layoutIfNeeded()
            }) { (isFinished) in
                print("Finished")
            }
            completion()
        }
    }
    
    func showMenuView(viewMain:UIView,isShow:Bool) -> Void {        
        if viewMenuClick == nil {
            viewMenuClick = Bundle.main.loadNibNamed("TopMenuVC", owner: self, options: nil)?.first as? TopMenuVC
            viewMenuClick?.frame.size.width = UIScreen.main.bounds.size.width
            viewMenuClick?.frame.size.height = CGFloat(Global.menuHeight) // 350
            viewMenuClick?.frame.origin.y = CGFloat(-Global.menuHeight)
            self.window?.addSubview(viewMenuClick!)
        }        
        viewMain.bringSubview(toFront: viewMenuClick!)
        Global().delay(delay: 0.1) {
            UIView.animate(withDuration: 0.4, animations: {
                if self.viewMenuClick?.frame.origin.y != 0 {
                    self.viewMenuClick?.frame.origin.y = 0
                    viewMain.frame.origin.y = CGFloat(Global.menuHeight)
                    self.viewMenuClick?.snapshot =  viewMain.snapshotView(afterScreenUpdates: true)
                    viewMain.addSubview((self.viewMenuClick?.snapshot)!)
                }else{
                    self.viewMenuClick?.frame.origin.y = CGFloat(-Global.menuHeight)
                    viewMain.frame.origin.y = 0
                    self.viewMenuClick?.snapshot?.removeFromSuperview()
                }
                self.viewMenuClick?.layoutIfNeeded()
                viewMain.layoutIfNeeded()
            }) { (isFinished) in
                print("Finished")
            }
        }        
    }
    
    func MenuclickWithCompletion(index:String) -> Void {
        Singleton.sharedSingleton.selectedMenuIndex = index
        DispatchQueue.main.async {
            if index == "1"{
                let home = HomeVC(nibName: "HomeVC", bundle: nil)
                self.push(viewControlle: home)
            }else if index == "2"{
                
            }else if index == "3"{
                
            }else if index == "4"{
                
            }else if index == "5"{
                let settings = SettingVC(nibName: "SettingVC", bundle: nil)
                self.push(viewControlle: settings)
            }else if index == "6"{
                let about = AboutVC(nibName: "AboutVC", bundle: nil)
                self.push(viewControlle: about)
            }else{
                
            }
        }
    }
    
    func push(viewControlle:UIViewController) -> Void {
        var isFound = false
        if self.navController?.visibleViewController?.view == viewControlle.view {
            return
        }
        if let arr = self.navController?.viewControllers {
            for vc in arr {
                if vc is ViewController {
                    self.navController?.popToViewController(vc, animated: false)
                    isFound = true
                    break
                }
            }
        }
        if isFound == false {
            self.navController?.pushViewController(viewControlle, animated: false)
        }
    }
    
    func pushWithAnimation(viewControlle:UIViewController,animated:Bool) -> Void {
        var isFound = false
        if self.navController?.visibleViewController?.view == viewControlle.view {
            return
        }
        if let arr = self.navController?.viewControllers {
            for vc in arr {
                if vc is ViewController {
                    self.navController?.popToViewController(vc, animated: animated)
                    isFound = true
                    break
                }
            }
        }
        if isFound == false {
            self.navController?.pushViewController(viewControlle, animated: animated)
        }
    }
    
    func logoutUser() {
        Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.g_UserDefaultKey.DeviceToken)
        
        /*Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.kLoggedInUserKey.User_id)
        Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.kLoggedInUserKey.Email)
        Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.kLoggedInUserKey.name)
        Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.kLoggedInUserKey.is_Varify)
        Singleton.sharedSingleton.saveToUserDefaults(value: "", forKey: Global.kLoggedInUserKey.status)
        Singleton.sharedSingleton.saveToUserDefaults(value: "false", forKey: Global.kLoggedInUserKey.IsLoggedIn)*/
 }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {

    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

