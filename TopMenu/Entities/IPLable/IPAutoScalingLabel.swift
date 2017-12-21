//
//  IPAutoScalingLabel.swift
//  RAVAS
//
//  Created by Tops on 12/15/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

class IPAutoScalingLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //print("required init")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("override init")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("awakeFromNib")
       // print("\(self.font.pointSize)")
        autoscalingSizeOflable()
        //print("\(self.font.pointSize)")
    }
    
    func autoscalingSizeOflable (){
        self.font = self.font.withSize(((UIScreen.main.bounds.size.width) * self.font.pointSize) / 320)
    }
}
