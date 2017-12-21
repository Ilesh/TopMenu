//
//  IPAutoScalingButton.swift
//  RAVAS
//
//  Created by Tops on 12/15/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

class IPAutoScalingButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        print("required init")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("override init")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        print("\(String(describing: self.titleLabel?.font.pointSize))")
        autoscalingSizeOflable()
        print("\(String(describing: self.titleLabel?.font.pointSize))")
    }
    
    func autoscalingSizeOflable (){
        self.titleLabel?.font = self.titleLabel?.font.withSize(((UIScreen.main.bounds.size.width) * (self.titleLabel?.font.pointSize)!) / 320)
    }
}
