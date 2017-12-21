//
//  TopMenuVC.swift
//  RAVAS
//
//  Created by Tops on 12/18/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

@objc protocol TopMenuDelegate {
    func didHide() -> Void
    func didSelectMenu(index:String) -> Void
}

class TopMenuVC: UIView {
    
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnLogFile: UIButton!
    @IBOutlet weak var btnSlave: UIButton!
    @IBOutlet weak var btnRavas: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    
    @IBOutlet weak var lblHomeIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblHomeTitle: IPAutoScalingLabel!
    @IBOutlet weak var lblRavasIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblRavasTitle: IPAutoScalingLabel!
    @IBOutlet weak var lblSlavIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblSlavTitle: IPAutoScalingLabel!
    @IBOutlet weak var lblLogFileIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblLogFileTitle: IPAutoScalingLabel!
    @IBOutlet weak var lblAboutIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblAboutTitle: IPAutoScalingLabel!
    @IBOutlet weak var lblSettingsIcon: IPAutoScalingLabel!
    @IBOutlet weak var lblSettingsTitle: IPAutoScalingLabel!
    
    let SelectedColor = #colorLiteral(red: 0.9333333333, green: 0.1882352941, blue: 0.1882352941, alpha: 1)
    let NormalColor = #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.2352941176, alpha: 1)
    
    var delegate:TopMenuDelegate?
    var tapGestureRecognizer : UITapGestureRecognizer?
    var snapshot:UIView? {
        didSet {
            if let delegate = delegate {
                tapGestureRecognizer = UITapGestureRecognizer(target: delegate, action: #selector(delegate.didHide))
                snapshot?.addGestureRecognizer(tapGestureRecognizer!)
            }
        }
    }
    
    func removeGesture() -> Void {
        if snapshot != nil {
            if tapGestureRecognizer != nil {
                snapshot?.removeGestureRecognizer(tapGestureRecognizer!)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        setSeletedColorOfIndex()
    }
    
    func setSeletedColorOfIndex(){
        lblHomeIcon.textColor = NormalColor
        lblHomeTitle.textColor = NormalColor
        lblRavasIcon.textColor = NormalColor
        lblRavasTitle.textColor = NormalColor
        lblSlavIcon.textColor = NormalColor
        lblSlavTitle.textColor = NormalColor
        lblLogFileIcon.textColor = NormalColor
        lblLogFileTitle.textColor = NormalColor
        lblSettingsIcon.textColor = NormalColor
        lblSettingsIcon.textColor = NormalColor
        lblAboutIcon.textColor = NormalColor
        lblAboutTitle.textColor = NormalColor
        
        switch Singleton.sharedSingleton.selectedMenuIndex {
        case "1":
            lblHomeIcon.textColor = SelectedColor
            lblHomeTitle.textColor = SelectedColor
            break
        case "2":
            lblRavasIcon.textColor = SelectedColor
            lblRavasTitle.textColor = SelectedColor
            break
        case "3":
            lblSlavIcon.textColor = SelectedColor
            lblSlavTitle.textColor = SelectedColor
            break
        case "4":
            lblLogFileIcon.textColor = SelectedColor
            lblLogFileTitle.textColor = SelectedColor
            break
        case "5":
            lblSettingsIcon.textColor = SelectedColor
            lblSettingsIcon.textColor = SelectedColor
            break
        case "6":
            lblAboutIcon.textColor = SelectedColor
            lblAboutTitle.textColor = SelectedColor
            break
        default:
            break
        }
    }
    
    //MARK:- UIBUTTON CLICK
    @IBAction func btnAllClick(_ sender:AnyObject){
        if let btn = sender as? UIButton {
            self.delegate?.didSelectMenu(index: "\(btn.tag)")
        }
    }
    
    @IBAction func btnCloseClick(_ sender:AnyObject) {
        self.delegate?.didHide()        
    }
}
