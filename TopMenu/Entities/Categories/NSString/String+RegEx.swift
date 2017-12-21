//
//  String+RegEx.swift
//  chilax
//
//  Created by Tops on 6/26/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

extension String {
    func isValidString(_ string: String, _ type: Global.kStringType) -> Bool {
        var charSet: CharacterSet?
        if type == Global.kStringType.AlphaNumeric {
            charSet = self.regexForAlphaNumeric()
        }
        else if type == Global.kStringType.AlphabetOnly {
            charSet = self.regexForAlphabetsOnly()
        }
        else if type == Global.kStringType.NumberOnly {
            charSet = self.regexForNumbersOnly()
        }
        else if type == Global.kStringType.Fullname {
            charSet = self.regexForFullnameOnly()
        }
        else if type == Global.kStringType.Username {
            charSet = self.regexForUsernameOnly()
        }
        else if type == Global.kStringType.Email {
            charSet = self.regexForEmail()
        }
        else if type == Global.kStringType.PhoneNumber {
            charSet = self.regexForPhoneNumber()
        }
        else {
            return true
        }
        
        let isValid: Bool = !(self.isValidStringForCharSet(string, charSet: charSet!).characters.count == 0)
        return isValid
    }

    func isValidStringForCharSet(_ string: String, charSet: CharacterSet) -> String {
        var strResult: String = ""
        let scanner = Scanner(string: string)
        var strScanResult : NSString?
        
        scanner.charactersToBeSkipped = nil
        
        while !scanner.isAtEnd {
            if scanner.scanUpToCharacters(from: charSet, into: &strScanResult) {
                strResult = strResult + (strScanResult as! String)
            }
            else {
                if !scanner.isAtEnd {
                    scanner.scanLocation = scanner.scanLocation + 1
                }
            }
        }
        return strResult
    }
    
    func regexForAlphabetsOnly() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "\n_!@#$%^&*()[]{}'\".,<>:;|\\/?+=\t~`-1234567890 ")
        return regex
    }
    
    func regexForNumbersOnly() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "1234567890").inverted
        return regex
    }
    
    func regexForAlphaNumeric() -> CharacterSet {
        let regex = CharacterSet(charactersIn: " \n_!@#$%^&*()[ ]{}'\".,<>:;|\\/?+=\t~`")
        return regex
    }
    
    func regexForFullnameOnly() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "\n_!@#$%^&*()[]{}'\".,<>:;|\\/?+=\t~`-1234567890")
        return regex
    }
    
    func regexForUsernameOnly() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "\n!@#$%^&*()[]{}'\".,<>:;|\\/?+=\t~` ")
        return regex
    }
    
    func regexForPhoneNumber() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "1234567890").inverted
        return regex
    }
    
    func regexForEmail() -> CharacterSet {
        let regex: CharacterSet = CharacterSet(charactersIn: "\n!#$^&*()[ ]{}'\",<>:;|\\/?=\t~`")
        return regex
    }

}
