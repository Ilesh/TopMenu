//
//  LocalizeHelper.swift
//  Structure_Demo_Swift3
//
//  Created by Tops on 5/9/17.
//  Copyright © 2017 Self. All rights reserved.
//

import UIKit

class LocalizeHelper: NSObject {

    private var myBundle: Bundle? = nil
    
    static let sharedInstance: LocalizeHelper = {
        let instance = LocalizeHelper()
        return instance
    }()
    
    override init() {
        super.init()
        // use systems main bundle as default bundle
        myBundle = Bundle.main
        
    }
    
    func localizedString(forKey key: String) -> String {
        return myBundle!.localizedString(forKey: key, value: "", table: nil)
    }
    
    //  Converted with Swiftify v1.0.6331 - https://objectivec2swift.com/
    func setLanguage(_ lang: String) {
        // path to this languages bundle
        let path: String? = Bundle.main.path(forResource: lang, ofType: "lproj")
        if path == nil {
            // there is no bundle for that language
            // use main bundle instead
            myBundle = Bundle.main
        }
        else {
            // use this bundle as my bundle from now on:
            myBundle = Bundle(path: path!)
            // to be absolutely shure (this is probably unnecessary):
            if myBundle == nil {
                myBundle = Bundle.main
            }
        }
    }
    
    func getLanguage() -> String {
        print("\(String(describing: myBundle?.bundlePath.last))")
        return myBundle!.bundlePath.last
    }
}
