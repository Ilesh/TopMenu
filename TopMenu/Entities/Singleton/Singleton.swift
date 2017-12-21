//
//  Singleton.swift
//  chilax
//
//  Created by Tops on 6/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//

import UIKit

class Singleton: NSObject {
    static let sharedSingleton = Singleton()
    var selectedMenuIndex = "1"
    
    //MARK: - Corner Radius:
    func setCornerRadius(view:UIView, radius:CGFloat) {
        view.layer.cornerRadius = radius
    }
    
    func localToPST(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: dt!)
    }
    
    func localToPSTT(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return dateFormatter.string(from: dt!)
    }
    
    func PSTToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss, MM:dd:yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "PST")
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "hh:mm:ss, MM:dd:yyyy"
        
        return dateFormatter.string(from: dt!)
    }
    // MARK: JSON Conversation
    func GetArrayfromJson(Json:String) -> [AnyObject] {
        var arrObjects:[AnyObject] = []
        if let data = Json.data(using: String.Encoding.utf8) {
            do{
                if let arrayOfInts = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject] {
                    print(arrayOfInts)
                    arrObjects = arrayOfInts
                }
            }
            catch{
                print("errro")
            }
        }
        return arrObjects
    }
    
    func GetDictionaryfromJson(Json:String) -> [String:String] {
        var arrObjects:[String:String] = [:]
        if let data = Json.data(using: String.Encoding.utf8) {
            do{
                if let arrayOfInts = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:String] {
                    print(arrayOfInts)
                    arrObjects = arrayOfInts
                }
            }
            catch{
                print("errro")
            }
        }
        return arrObjects
    }
    
    func conVertToJSONDictionary(jsonObject:[String: String])-> String {
        print("start time\(Date())")
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            let data = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            print("End time\(Date())")
            return data
        } catch {
            print(error.localizedDescription)
            return ""
        }
        
    }
    
    func conVertToJSONArray(jsonObject:NSMutableDictionary)-> String {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? ""
            
        } catch {
            print(error.localizedDescription)
            return ""
        }
        
    }
    
    func conVertToJSONArrayWithAnyObjects(jsonObject:[AnyObject])-> String {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? ""
            
        } catch {
            print(error.localizedDescription)
            return ""
        }
        
    }
    
    
    
    /*func firstcharacterwithColor(_ str:String)-> String{
        var strtoreturn :String = ""
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        var color = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        if(str.characters.count >= 1){
            //"llo, playgroun"
            let Component = str.components(separatedBy: " ")
            for compo in Component
            {
                if compo == ""
                {
                    return strtoreturn.uppercased()
                }
                if strtoreturn.characters.count >= 2
                {
                    return strtoreturn.uppercased()
                }
                let decimalCharacters = CharacterSet.decimalDigits
                let decimalRange = compo.rangeOfCharacter(from: decimalCharacters)
                if decimalRange != nil {
                    print("Numbers found")
                }
                else{
                    let char = compo.substring(with: (str.characters.index(str.startIndex, offsetBy: 0) ..< str.characters.index(str.endIndex, offsetBy: 1-str.characters.count))).uppercased()
                    strtoreturn.append(char)
                }
            }
            if color == UIColor.white || color == UIColor.cyan
            {
                color = Global.QWALLAppColor.BlueDark
            }
            return strtoreturn.uppercased()
        }
        return strtoreturn.uppercased()
    }*/
    
    
    // MARK: -  Skip Backup Attribute for File
    func addSkipBackupAttributeToItemAtURL(URL:NSURL) {
        assert(FileManager.default.fileExists(atPath: URL.path!))
        do {
            try URL.setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
        }
        catch let error as NSError {
            print("Error excluding \(URL.lastPathComponent!) from backup \(error)");
        }
    }
    
    // MARK: -  Device Specific Method
//    func getDeviceSpecificNibName(_ strNib: String) -> String {
//        if Global.is_iPhone._4 {
//            return strNib + ("_4")
//        }
//        else {
//            return strNib
//        }
//    }
    
    func getDeviceSpecificFontSize(_ fontsize: CGFloat) -> CGFloat {
        return ((Global.screenWidth) * fontsize) / 320
    }
    
    // MARK: -  UserDefaults Methods
    func saveToUserDefaults (value: String, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value , forKey: key as String)
        defaults.synchronize()
    }
    
    func Numericalformat(count:Int) -> String {
        if count > 100000 {
            return String(Int(count / 1000))+"k"
        }
        else{
            return String(count)
        }
    }
    
    func retriveFromUserDefaults (key: String) -> String? {
        let defaults = UserDefaults.standard
        if let strVal = defaults.string(forKey: key as String) {
            return strVal
        }
        else{
            return "" as String?
        }
    }
    
    
    // MARK: -  String RemoveNull and Trim Method
    func removeNull (str:String) -> String {
        if (str == "<null>" || str == "(null)" || str == "N/A" || str == "n/a" || str.isEmpty) {
            return ""
        } else {
            return str
        }
    }
    
    func kTRIM(string: String) -> String {
        return string.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
        
    func getSizeFromAttributedString (str: NSAttributedString, stringWidth width: CGFloat, maxHeight mHeight: CGFloat) -> CGSize {
        let rect : CGRect = str.boundingRect(with: CGSize(width: width, height: mHeight), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        return rect.size
    }
    
    // MARK: -  Attributed String
    func setStringLineSpacing(_ strText: String, floatSpacing: CGFloat, intAlign: Int) -> NSMutableAttributedString {
        //o=center  1=left = 2=right
        let attributedString = NSMutableAttributedString(string: strText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = floatSpacing
        if intAlign == 0 {
            paragraphStyle.alignment = .center
        }
        else if intAlign == 1 {
            paragraphStyle.alignment = .left
        }
        else {
            paragraphStyle.alignment = .right
        }
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: (strText.characters.count )))
        return attributedString
    }
    
    /*func setButtonStringChilaxFontBaseLine(_ strText: String, floatIconFontSize:CGFloat, floatTextFontSize: CGFloat, floatBase: CGFloat, intIconPos: Int) -> NSMutableAttributedString { //first character Chilax font and other all GothamBook font
        let attributedString = NSMutableAttributedString(string: strText)
        if (intIconPos == 1) {//first character icon
            attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: Global.kFont.QWALLIcon, size: Global.singleton.getDeviceSpecificFontSize(floatIconFontSize))!, range: NSRange(location: 0, length: 1))
            attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: Global.kFont.QuicksandRegular, size: Global.singleton.getDeviceSpecificFontSize(floatTextFontSize))!, range: NSRange(location: 1, length: strText.characters.count-1))
            attributedString.addAttribute(NSBaselineOffsetAttributeName, value: Global.singleton.getDeviceSpecificFontSize(floatBase), range: NSRange(location: 1, length: strText.characters.count-1))
        }
        else if (intIconPos == 2) {//last character icon
            attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: Global.kFont.QuicksandRegular, size: Global.singleton.getDeviceSpecificFontSize(floatTextFontSize))!, range: NSRange(location: 0, length: strText.characters.count-1))
            attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: Global.kFont.QWALLIcon, size: Global.singleton.getDeviceSpecificFontSize(floatIconFontSize))!, range: NSRange(location: strText.characters.count-1, length: 1))
            attributedString.addAttribute(NSBaselineOffsetAttributeName, value: Global.singleton.getDeviceSpecificFontSize(floatBase), range: NSRange(location: 0, length: strText.characters.count-2))
        }
        return attributedString;
    }*/
    
    func removeShadow(to view:UIView) {
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowOpacity = 0.0
    
    }
    
    
    
    func setShadow(to view:UIView) {
        
        let shadowSize : CGFloat = 2.0
        //view.layer.frame = view.bounds
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: view.frame.size.width + shadowSize,
                                                   height: view.frame.size.height + shadowSize))
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.6).cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowPath = shadowPath.cgPath
    }
    
    
    // MARK: -  TextField Validation Method
    func validateEmail(strEmail: String) -> Bool {
        let emailRegex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: strEmail)
    }
    
    func validatePhoneNumber(strPhone: String) -> Bool {
        let phoneRegex: String = "[0-9]{8}([0-9]{1,3})?"
        let test = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return test.evaluate(with: strPhone)
    }
    

    // MARK: -  get Directory Path
    func getDocumentDirPath() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        return documentsPath
    }
    
    /*func addShowLoaderInView(viewObj: UIView, boolShow: Bool, enableInteraction: Bool) -> UIView? {
        let viewSpinnerBg = UIView(frame: CGRect(x: (Global.screenWidth - 54.0) / 2.0, y: (Global.screenHeight - 54.0) / 2.0, width: 54.0, height: 54.0))
        viewSpinnerBg.backgroundColor = Global().RGB(r: 240, g: 240, b: 240, a: 0.4)
        viewSpinnerBg.layer.masksToBounds = true
        viewSpinnerBg.layer.cornerRadius = 5.0
        viewObj.addSubview(viewSpinnerBg)
        
        if boolShow {
            viewSpinnerBg.isHidden = false
        }
        else {
            viewSpinnerBg.isHidden = true
        }
        
        if !enableInteraction {
            viewObj.isUserInteractionEnabled = false
        }
        
        //add spinner in view
        let rtSpinKitspinner: RTSpinKitView = RTSpinKitView(style: RTSpinKitViewStyle.styleFadingCircle , color: UIColor.white)
        rtSpinKitspinner.center = CGPoint(x: (viewSpinnerBg.frame.size.width - 8.0) / 2.0, y: (viewSpinnerBg.frame.size.height - 8.0) / 2.0)
        rtSpinKitspinner.color = Global.kAppColor.Blue
        rtSpinKitspinner.startAnimating()
        viewSpinnerBg.addSubview(rtSpinKitspinner)
        
        return viewSpinnerBg
    }*/
    
    
    // MARK: -  Hide and remove loader from view
    func hideRemoveLoaderFromView(removableView: UIView, mainView: UIView) {
        removableView.isHidden = true
        removableView.removeFromSuperview()
        mainView.isUserInteractionEnabled = true
    }
    
    //MARK: TIME FORMAT
    func TimeFormatter_12H() -> DateFormatter {
        //06:35 PM
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter
    }
    
    func TimeFormatter_24_H() -> DateFormatter {
        //19:29:50
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter
    }
    func TimeFormatter_24_H_M() -> DateFormatter {
        //19:29
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
    
    //MARK: DATE FORMAT
    func dateFormatterOnlyTime() -> DateFormatter {
        //19:29:50
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter
    }
    
    func dateFormatterFullWiteTimeZone() -> DateFormatter {
        //2016-10-24 19:29:50 +0000
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    func dateFormatterFull_MDY_HMS_SocialDisplay() -> DateFormatter {
        //2017-05-25 00:05:13
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy h:mm a"
        return dateFormatter
    }
    
    func dateFormatterFull_MDY_HMS() -> DateFormatter {
        //2017-05-25 00:05:13
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    func dateFormatter() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }
    
    func dateFormatterForDisplay() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        return dateFormatter
    }
    func dateFormatterMMDDYYY() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter
    }
    
    func dateFormatterYYYYMMDD() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    func ConvertStrintoDAte(dateStr:String) -> Date? {
        if dateStr == ""
        {
            return nil
        }
        let datee = Singleton.sharedSingleton.dateFormatterFull_MDY_HMS().date(from: dateStr)
        return datee
    }
    
    func dateFormatterForDisplay_DMMMY() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return dateFormatter
    }
    func dateFormatterForCall() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    func dateFormatterForYearOnly() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }
    func dateFormatterForMonthINNumberOnly() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter
    }
    func dateFormatterForDaysMonthsYears() -> DateFormatter {
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, d LLL yyyy"
        return dateFormatter
    }
    func dateFormatterForYMD_T_HMSsss() -> DateFormatter {
        //yyyy-MM-dd'T'HH:mm:ss.SSS        
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter
    }
    func dateFormatterForYMD_T_HMS() -> DateFormatter {
        //yyyy-MM-dd'T'HH:mm:ss
        var dateFormatter: DateFormatter
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }
    
    func makeDate(year: Int, month: Int, day: Int, hr: Int, min: Int, sec: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        // calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    
    func calculateAgefromDateString(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
    //MARK:-  get Country JSon array
    func getCountryCodeJsonDataArray() -> NSArray {
        do {
            let countrydata: Data = try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "CountryCode", ofType: "json")!))
            do {
                if let arrData: NSArray = try JSONSerialization.jsonObject(with: countrydata, options: []) as? NSArray {
                    return arrData
                }
            } catch {
            }
        }
        catch {
        }
        return NSArray()
    }
    
    // convert images into base64 and keep them into string
    
    func convertImageToBase64(image: UIImage) -> String {
        
        let imageData = UIImagePNGRepresentation(image)
        let base64Str = imageData?.base64EncodedString()
        
        
        return base64Str!
        
    }
    
    // convert images into base64 and keep them into string
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64Encoded: base64String, options: NSData.Base64DecodingOptions(rawValue: 0) )
        
        let decodedimage = UIImage(data: decodedData! as Data)
        
        return decodedimage!
        
    }
    
    //MARK:- NUMERICAL TO TEXT CONVERTED
    
    func GetNumericalMonthFromText(strMonth:String) -> String{
        if strMonth == "Jan" || strMonth == "jan" {
            return "1"
        }else if strMonth == "Feb" || strMonth == "feb" {
            return "2"
        }
        else if strMonth == "Mar" || strMonth == "mar" {
            return "3"
        }
        else if strMonth == "Apr" || strMonth == "apr" {
            return "4"
        }
        else if strMonth == "May" || strMonth == "may" {
            return "5"
        }
        else if strMonth == "Jun" || strMonth == "jun" {
            return "6"
        }
        else if strMonth == "Jul" || strMonth == "jul" {
            return "7"
        }
        else if strMonth == "Aug" || strMonth == "aug" {
            return "8"
        }
        else if strMonth == "Sep" || strMonth == "sep" {
            return "9"
        }
        else if strMonth == "Oct" || strMonth == "oct" {
            return "10"
        }
        else if strMonth == "Nov" || strMonth == "nov" {
            return "11"
        }
        else if strMonth == "Dec" || strMonth == "dec" {
            return "12"
        }else{
            return strMonth
        }
    }
    
    func GetTextToNumericalMonth(strMonth:String) -> String{
        if strMonth == "1" || strMonth == "jan" {
            return "Jan"
        }else if strMonth == "2" || strMonth == "feb" {
            return "Feb"
        }
        else if strMonth == "3" || strMonth == "mar" {
            return "Mar"
        }
        else if strMonth == "4" || strMonth == "apr" {
            return "Apr"
        }
        else if strMonth == "5" || strMonth == "may" {
            return "May"
        }
        else if strMonth == "6" || strMonth == "jun" {
            return "Jun"
        }
        else if strMonth == "7" || strMonth == "jul" {
            return "Jul"
        }
        else if strMonth == "8" || strMonth == "aug" {
            return "Aug"
        }
        else if strMonth == "9" || strMonth == "sep" {
            return "Sep"
        }
        else if strMonth == "10" || strMonth == "oct" {
            return "Oct"
        }
        else if strMonth == "11" || strMonth == "nov" {
            return "Nov"
        }
        else if strMonth == "12" || strMonth == "dec" {
            return "Dec"
        }else{
            return strMonth
        }
    }

    func GetDateStringFromDates(sDay:String,sMont:String,sYear:String,is_current:Bool,eDay:String,eMont:String,eYear:String) -> String {
        var strDates = ""
        let smonthname = Singleton.sharedSingleton.GetTextToNumericalMonth(strMonth: sMont)
        let emonthname = Singleton.sharedSingleton.GetTextToNumericalMonth(strMonth: eMont)
        if sDay == "" && sMont == "" && sYear == "" && eDay == "" && eMont == "" && eYear == "" && is_current {
            strDates = "N/A - Current"
            return strDates
        }
        else if sDay == "" && sMont == "" && sYear == "" && eDay == "" && eMont == "" && eYear == "" && !is_current {
            strDates = "N/A"
            return strDates
        }
        
        if is_current {
            if sDay == "" && sMont == "" && sYear == "" {
                strDates = "N/A"
            }
            else if sDay == "" && sMont != "" && sYear != "" {
                let arr = [smonthname,sYear]
                strDates = "\(arr.joined(separator: "/")) - Current"
            }
            else if sDay == "" && sMont == "" && sYear != "" {
                let arr = [sYear]
                strDates = "\(arr.joined(separator: "/")) - Current"
            }else{
                let arr = [sMont,sDay,sYear]
                strDates = "\(arr.joined(separator: "/")) - Current"
            }
        }else{
            if sDay == "" && sMont == "" && sYear == "" {
                strDates = "N/A - "
            }
            else if sDay == "" && sMont != "" && sYear != "" {
                let arr = [smonthname,sYear]
                strDates = "\(arr.joined(separator: "/")) - "
            }
            else if sDay == "" && sMont == "" && sYear != "" {
                let arr = [sYear]
                strDates = "\(arr.joined(separator: "/")) - "
            }
            else{
                let arr = [sMont,sDay,sYear]
                strDates = "\(arr.joined(separator: "/")) - "
            }
            
            if eDay == "" && eMont == "" && eYear == "" {
                strDates = strDates + "N/A"
            }
            else if eDay == "" && eMont != "" && eYear != "" {
                let arr = [emonthname,eYear]
                strDates = strDates + "\(arr.joined(separator: "/"))"
            }
            else if eDay == "" && eMont == "" && eYear != "" {
                let arr = [eYear]
                strDates = strDates + "\(arr.joined(separator: "/"))"
            }
            else{
                let arr = [eMont,eDay,eYear]
                strDates = strDates + "\(arr.joined(separator: "/"))"
            }
        }
        return strDates
    }
    
    func SetSingleDateStringFromDates(sDay:String,sMont:String,sYear:String) -> String {
        var strDates = ""
        let smonthname = Singleton.sharedSingleton.GetTextToNumericalMonth(strMonth: sMont)
        
        if sDay == "" && sMont == "" && sYear == "" {
            strDates = "N/A"
        }
        else if sDay == "" && sMont != "" && sYear != "" {
            let arr = [smonthname,sYear]
            strDates = "\(arr.joined(separator: "/"))"
        }
        else if sDay == "" && sMont == "" && sYear != "" {
            let arr = [sYear]
            strDates = "\(arr.joined(separator: "/"))"
        }else{
            let arr = [sMont,sDay,sYear]
            strDates = "\(arr.joined(separator: "/"))"
        }
        return strDates
    }
    
    //Phone Number masking
    
    func formattedNumber(number: String) -> String {
        var cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var mask = "(XXX) XXX XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask.characters {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func isPassword(str:String) -> Bool
    {
        let charset = CharacterSet(charactersIn: "aw")
        if str.rangeOfCharacter(from: charset) != nil {
            return true
        }else{
            return false
        }
    }
    
    func formattedHRD_NumberDisplay(number: String) -> String {
        var cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var mask = "(XXX) XXX-XXXX ext.XXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask.characters {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func format(phoneNumber sourcePhoneNumber: String) -> String? {
        
        // Remove any character that is not a number
        let numbersOnly = sourcePhoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let length = numbersOnly.characters.count
        let hasLeadingOne = numbersOnly.hasPrefix("1")
        
        // Check for supported phone number length
        guard length == 7 || length == 10 || (length == 11 && hasLeadingOne) else {
            return nil
        }
        
        let hasAreaCode = (length >= 10)
        var sourceIndex = 0
        
        // Leading 1
        var leadingOne = ""
        if hasLeadingOne {
            leadingOne = "1 "
            sourceIndex += 1
        }
        
        // Area code
        var areaCode = ""
        if hasAreaCode {
            let areaCodeLength = 3
            guard let areaCodeSubstring = numbersOnly.characters.substring(start: sourceIndex, offsetBy: areaCodeLength) else {
                return nil
            }
            areaCode = String(format: "(%@) ", areaCodeSubstring)
            sourceIndex += areaCodeLength
        }
        
        // Prefix, 3 characters
        let prefixLength = 3
        guard let prefix = numbersOnly.characters.substring(start: sourceIndex, offsetBy: prefixLength) else {
            return nil
        }
        sourceIndex += prefixLength
        
        // Suffix, 4 characters
        let suffixLength = 4
        guard let suffix = numbersOnly.characters.substring(start: sourceIndex, offsetBy: suffixLength) else {
            return nil
        }
        
        return leadingOne + areaCode + prefix + "-" + suffix
    }
    
    func getDouble(value:Any) -> Double {
        if let double_V = value as? Double {
            return double_V
        } else if let Int_V = value as? Int {
            return Double(Int_V)
        }else if let String_V = value as? String {
            return String_V.toDouble()
        }
        else{
            return 0.0
        }
    }
    
    
}


extension Array where Element: Equatable {
    
    mutating func removeElement(_ element: Element) -> Element? {
        if let index = index(of: element) {
            return remove(at: index)
        }
        return nil
    }
}

extension String.CharacterView {
    /// This method makes it easier extract a substring by character index where a character is viewed as a human-readable character (grapheme cluster).
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
}
