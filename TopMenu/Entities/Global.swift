//
//  Global.swift
//  QWALL
//
//  Created by Tops on 6/13/17.
//  Copyright © 2017 Tops. All rights reserved.
//  Update New branch for M4Dev

import UIKit
class Global {
    //SDK keys & secrets etc.
    struct tagType {
        static let ContactDetail = "ContactDetail"
        static let Activity = "Activity"
        static let Tasks = "Tasks"
        
    }
    static let menuHeight:Float = 320
    static let nav_Timer:Float = 0.4
    static let DeviceUUID = UIDevice.current.identifierForVendor!.uuidString
    static let PhoneDigitLimit = 15
    static var IsOffline:Bool = false
    struct SDKKeys {
        struct Twilio {
            static let Id = "AC313568df00fba35fcca607c6a9866d84"
            static let Secret = "1c024ca026674daf6e774901f809ca1d"
            static let FromNumber = "+447481344102"
            static let MsgURL = "https://api.twilio.com/2010-04-01/Accounts/" + Global.SDKKeys.Twilio.Id + "/Messages.json"
        }
        struct Adobe {
            static let ClientId = "8dc74beebd0148c2b0cfaf7eaeddcfbd"
            static let Secret = "0b7e45ae-b581-4e27-b7a7-cc123a89f9aa"
        }
    }
    static var lastPhone:String = ""
    static var lastpass:String = ""
    static var lastrepass:String = ""
    
    struct Tables {
         static let DBTABLE_CONTACT_MASTER = "Contact_Master";
         static let DBTABLE_EMAIL = "contact_email";
         static let DBTABLE_PHONE = "contact_phone";
         static let DBTABLE_FAMILY = "contact_family";
         static let DBTABLE_ADDRESS = "contact_address";
         static let DBTABLE_SYNCMASTER = "sync_master";
         static let DBTABLE_DELETE = "delete_master";
         static let DBTABLE_TAG     = "tag_master";
         static let DBTABLE_RELATION = "relation_master";
         static let DBTABLE_MASTER = "master";
    }
    
    struct QWALLAppColor {
        static let BlueDark = Global().RGB(r: 28, g: 117, b: 188, a: 1)
        static let Green = Global().RGB(r: 141, g: 199, b: 65, a: 1)
        static let BlueLight = #colorLiteral(red: 0.1098039216, green: 0.4588235294, blue: 0.737254902, alpha: 1)
        static let Black = Global().RGB(r: 0, g: 0, b: 0, a: 1)
        static let lightGray = Global().RGB(r: 137, g: 138, b: 141, a: 1)
        static let darlWind = Global().RGB(r: 60, g: 78, b: 93, a: 1)
        static let Clody = Global().RGB(r: 241, g: 246, b: 248, a: 1) //
        static let ECEC = Global().RGB(r: 236, g: 236, b: 236, a: 1)
        static let orange = Global().RGB(r: 255, g: 114, b: 0, a: 1)
        static let cynn = Global().RGB(r: 5, g: 176, b: 158, a: 1)
        static let DarkGray = Global().RGB(r: 100, g: 100, b: 100, a: 1)
        static let White = Global().RGB(r: 255, g: 255, b: 255, a: 1)
    }
    
    struct Platform {
        static let isSimulator: Bool = {
            #if arch(i386) || arch(x86_64)
                return true
            #endif
            return false
        }()
    }
    
    //Device Compatibility
    struct is_Device {
        static let _iPhone = (UIDevice.current.model as String).isEqual("iPhone") ? true : false
        static let _iPad = (UIDevice.current.model as String).isEqual("iPad") ? true : false
        static let _iPod = (UIDevice.current.model as String).isEqual("iPod touch") ? true : false
    }
    //DatabaseKey
    struct DatabaseKey {
         static let  WC_USERID = "userid";
         static let  WC_LOCAL_UNIQUE_ID = "local_unique_id";
         static let  WC_ID = "id";
         static let  WC_LICENSE_MASTER_ID = "license_master_id";
         static let  WC_EMAIL = "email";
         static let  WC_PREFIX = "prefix";
         static let  WC_FIRST_NAME = "first_name";
         static let  WC_MIDDLE_NAME = "middle_name";
         static let  WC_LAST_NAME = "last_name";
         static let  WC_NICK_NAME = "nick_name";
         static let  WC_GENDER = "gender";
         static let  WC_COMPANY_NAME = "company_name";
         static let  WC_DESIGNATION = "designation";
         static let  WC_OCCUPATION_ID = "occupation_id";
         static let  WC_WORK_ID = "work_id";
         static let  WC_PHONE_NO = "phone_no";
         static let  WC_FULL_ADDRESS = "full_address";
         static let  WC_LATITUDE = "latitude";
         static let  WC_LONGITUDE = "longitude";
         static let  WC_IS_CUSTOM = "is_custom";
         static let  WC_ADDRESS_LINE_1 = "address_line_1";
         static let  WC_ADDRESS_LINE_2 = "address_line_2";
         static let  WC_CITY = "city";
         static let  WC_STATE = "state";
         static let  WC_ZIP_CODE = "zip_code";
         static let  WC_COUNTRY = "country";
         static let  WC_DATEOFBIRTH = "dateofbirth";
         static let  WC_DOB_DAY = "dob_day";
         static let  WC_DOB_MONTH = "dob_month";
         static let  WC_DOB_YEAR = "dob_year";
         static let  WC_CONTACT_PIC = "contact_pic";
         static let  WC_LANGUAGE = "language";
         static let  WC_SSN = "ssn";
         static let  WC_SOLUTION_NO = "solution_no";
         static let  WC_IS_PRIMARY = "is_primary";
         static let  WC_IS_CHILD = "is_child";
         static let  WC_RELATION_WITH_PARTNER = "relation_with_partner";
         static let  WC_IS_ASSOCIATE = "is_associate";
         static let  WC_IS_SUPPORT_USER = "is_support_user";
         static let  WC_ASSOCIATE_LEVEL = "associate_level";
         static let  WC_SUPPORT_USER_LEVEL = "support_user_level";
         static let  WC_IS_PROFILE_RECORD = "is_profile_record";
         static let  WC_IS_SUPER_ADMIN = "is_super_admin";
         static let  WC_CREATED_TYPE = "created_type";
         static let  WC_IMPORT_SHEET_ID = "import_sheet_id";
         static let  WC_IS_GOOGLE_DELETE = "is_google_delete";
         static let  WC_GOOGLE_USER_ID = "google_user_id";
         static let  WC_GOOGLE_ETAG = "google_etag";
         static let  WC_HOTMAIL_USER_ID = "hotmail_user_id";
         static let  WC_YAHOO_USER_ID = "yahoo_user_id";
         static let  WC_YAHOO_GUIDE = "yahoo_guide";
         static let  WC_TWITTER_USER_ID = "twitter_user_id";
         static let  WC_FACEBOOK_USER_ID = "facebook_user_id";
         static let  WC_FB_URL = "fb_url";
         static let  WC_LINKEDIN_URL = "linkedin_url";
         static let  WC_TWITTER_URL = "twitter_url";
         static let  WC_TWITTER_LAST_TWEET = "twitter_last_tweet";
         static let  WC_TWITTER_LAST_TWEET_ID = "twitter_last_tweet_id";
         static let  WC_LAST_TWEET_TIME = "last_tweet_time";
         static let  WC_GOOGLE_URL = "google_url";
         static let  WC_SKYPE_ID = "skype_id";
         static let  WC_WEBSITE = "website";
         static let  WC_UPDATED_TIME = "updated_time";
         static let  WC_CREATED_DATE = "created_date";
         static let  WC_CREATED_BY = "created_by";
         static let  WC_MODIFIED_DATE = "modified_date";
         static let  WC_MODIFIED_BY = "modified_by";
         static let  WC_STATUS = "status";
         static let  WC_DIDUPDATE = "didupdate";
         static let  WC_ISDELETED = "isdeleted";
        
        // Table email Column Keys
         static let WE_ID = "id";
         static let WE_CONTACT_ID = "contact_id";
         static let WE_SYNC_DATE = "sync_date";
         static let WE_EMAIL_ID = "email_id";
         static let WE_EMAIL = "email";
         static let WE_TYPE = "type";
         static let WE_IS_PRIMARY = "is_primary";
         static let WE_IS_UNSUBSCRIBED = "is_unsubscribed";
         static let WE_IS_UPDATED = "is_updated";
         static let WE_CREATED_DATE = "created_date";
         static let WE_CREATED_BY = "created_by";
         static let WE_MODIFIED_DATE = "modified_date";
         static let WE_MODIFIED_BY = "modified_by";
         static let WE_STATUS = "status";
        
        // Table phone Column Keys
         static let WP_ID = "id";
         static let WP_CONTACT_ID = "contact_id";
         static let WP_SYNC_DATE = "sync_date";
         static let WP_PHONE_ID = "phone_id";
         static let WP_PHONE = "phone";
         static let WP_TYPE = "type";
         static let WP_IS_PRIMARY = "is_primary";
         static let WP_CREATED_DATE = "created_date";
         static let WP_CREATED_BY = "created_by";
         static let WP_MODIFIED_DATE = "modified_date";
         static let WP_MODIFIED_BY = "modified_by";
         static let WP_STATUS = "status";
        
        // Table tag Column Keys
        /*
         *   DEFAULT '1' COMMENT '0.Deactive,1.Active(Default), 2. Archive'
         * */
         static let WT_ID = "id";
         static let WT_CONTACT_ID = "contact_id";
         static let WT_SYNC_DATE = "sync_date";
         static let WT_TAG_ID = "tag_id";
         static let WT_TAG_NAME = "tag_name";
         static let WT_CREATED_DATE = "created_date";
         static let WT_CREATED_BY = "created_by";
         static let WT_MODIFIED_DATE = "modified_date";
         static let WT_MODIFIED_BY = "modified_by";
         static let WT_STATUS = "status";
        
        // Table family Column Keys
         static let WF_ID = "id";
         static let WF_CONTACT_ID = "contact_id";
         static let WF_SYNC_DATE = "sync_date";
         static let WF_FAMILY_ID = "family_id";
         static let WF_MEMBER_ID = "member_id";
         static let WF_RELATION_TYPE = "relation_type";
         static let WF_CREATED_DATE = "created_date";
         static let WF_CREATED_BY = "created_by";
         static let WF_MODIFIED_DATE = "modified_date";
         static let WF_MODIFIED_BY = "modified_by";
         static let WF_STATUS = "status";
         static let WF_SERVER_STATUS = "issaved_server";
        
        
        // Table address Column Keys
         static let WA_ID = "id";
         static let WA_CONTACT_ID = "contact_id";
         static let WA_SYNC_DATE = "sync_date";
         static let WA_ADDRESS_ID = "address_id";
         static let WA_FULL_ADDRESS = "full_address";
         static let WA_LATITUDE = "latitude";
         static let WA_LONGITUDE = "longitude";
         static let WA_IS_CUSTOM = "is_custom";
         static let WA_ADDRESS_LINE_1 = "address_line_1";
         static let WA_ADDRESS_LINE_2 = "address_line_2";
         static let WA_CITY = "city";
         static let WA_STATE = "state";
         static let WA_ZIP_CODE = "zip_code";
         static let WA_COUNTRY = "country";
         static let WA_TYPE = "type";
         static let WA_IS_PRIMARY = "is_primary";
         static let WA_CREATED_DATE = "created_date";
         static let WA_CREATED_BY = "created_by";
         static let WA_MODIFIED_DATE = "modified_date";
         static let WA_MODIFIED_BY = "modified_by";
         static let WA_STATUS = "status";
        
        // Table relation Column Keys
         static let WR_ID = "id";
         static let WR_CONTACT_ID = "contact_id";
         static let WR_SYNC_DATE = "sync_date";
    }
    
    
    // database error and success message.
    struct DBMANAGERMESSAGES {
        static let WDError = "You have no records available."
    }
    
    //Display Size Compatibility
    struct is_iPhone {
        static let _X = (UIScreen.main.bounds.size.height == 2436 ) ? true : false
        static let _6p = (UIScreen.main.bounds.size.height >= 736.0 ) ? true : false
        static let _6 = (UIScreen.main.bounds.size.height <= 667.0 && UIScreen.main.bounds.size.height > 568.0) ? true : false
        static let _5 = (UIScreen.main.bounds.size.height <= 568.0 && UIScreen.main.bounds.size.height > 480.0) ? true : false
        static let _4 = (UIScreen.main.bounds.size.height <= 480.0) ? true : false
    }
    
    //IOS Version Compatibility
    struct is_iOS {
        static let _11 = ((Float(UIDevice.current.systemVersion as String))! >= Float(11.0)) ? true : false
        static let _10 = ((Float(UIDevice.current.systemVersion as String))! >= Float(10.0)) ? true : false
        static let _9 = ((Float(UIDevice.current.systemVersion as String))! >= Float(9.0) && (Float(UIDevice.current.systemVersion as String))! < Float(10.0)) ? true : false
        static let _8 = ((Float(UIDevice.current.systemVersion as String))! >= Float(8.0) && (Float(UIDevice.current.systemVersion as String))! < Float(9.0)) ? true : false
    }
    
    // MARK: -  Shared classes
    static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    static let singleton = Singleton.sharedSingleton
    static let g_Databasename = "QWALL_Master"
    static let PhoneBook_Master = "phonebook_master"
    
    
    // MARK: -  Screen size
    static let screenWidth : CGFloat = (Global.appDelegate.window!.bounds.size.width)
    static let screenHeight : CGFloat = (Global.appDelegate.window!.bounds.size.height)
    
    // MARK: -  Get UIColor from RGB
    public func RGB(r: Float, g: Float, b: Float, a: Float) -> UIColor {
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: CGFloat(a))
    }
    
    // MARK: -  Dispatch Delay
    func delay(delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
   // MARK: -  Web service Base URL
    
  
   static let baseURLPath = "http://topsdemo.co.in/webservices/ble_itrack/ws/"  //M_1
    
   // MARK: -  Application Colors
   struct kAppColor {
        static let Blue = Global().RGB(r: 47.0, g: 128.0, b: 209.0, a: 1.0)
   }

    // MARK: - Application Fonts
    struct kFont {
        static let Muli_Semibold = "Muli-SemiBold"
        static let Muli_Bold = "Muli-Bold"
        static let Muli_Regular = "Muli-Regular"
        static let QwallFont = "QWall_TOPS"
    }

    struct kFontSize {
        static let  TextFieldSmallSize_8:CGFloat = 8
        static let  TextFieldSize:CGFloat = 12
        static let  ButtonSize:CGFloat = 15
        static let  LabelSize:CGFloat = 14
    }
    
    struct g_UserDefaultKey {
        static let DeviceToken: String! = "DEVICE_TOKEN"
    }
    
    struct kAddActivity {
        static let  SelectLifeEvents = "Select Life Events"
        
    }

    // MARK: -  User Data
    struct kLoggedInUserKey {
        static let IsLoggedIn: String! = "QWALLUserIsLoggedIn"
        static let User_id: String! = "QWALLUserId"
        //static let FullName: String! = "QWALLUserFullName"
        static let FirstName: String! = "QWALLUserFName"
        static let LastName: String! = "QWALLUserLName"
        static let SolutionNumber: String! = "QWALLSolutionid"
        static let RoleUser: String! = "QWALLrole"
        static let company_access_code:String = "QWALLcompany_access_code"
        static let contact_id:String = "QWALLcontact_id"
        static let contact_pic:String = "QWALLcontact_pic"
        static let expires:String = "QWALLexpires"
        static let is_details_updated:String = "QWALLis_details_updated"
        static let is_superuser:String = "QWALLisis_superuser"
        static let license_master_id:String = "QWALLislicense_master_id"
        static let onboarding_step:String = "QWALLisonboarding_step"
        static let parent_login_id:String = "QWALLisparent_login_id"
        static let profile_contact_id:String = "QWALLisprofile_contact_id"
        static let support_user_level:String = "QWALLissupport_user_level"
        static let user_roles:String = "QWALLisuser_roles"
        static let user_type:String = "QWALLisuser_type"
        
        static let Email: String! = "QWALLUserEmail"
        static let name: String! = "QWALLUserName"
        static let Gender: String! = "QWALLUserGender"
        static let MobileNumber: String! = "QWALLUserMobileNumber"
        static let Phone: String! = "QWALLUserPhone"
        static let CountryCode: String! = "QWALLUserCountryCode"
        static let CountryName: String! = "QWALLUserCountryName"
        static let rememPassword: String! = "QWALLUser"
        static let rememEmailornumber: String! = "QWALLUserUsernameNumberEmail"
        static let DOB: String! = "QWALLUserDOB"
        static let AccessToken: String! = "QWALLUserAccessToken"
        static let FirstTimeLogin: String! = "QWALLUserFirstTimeLogin"
        
        static let is_remembered: String! = "QWALLUserIsPrivat"
        static let is_Privat: String! = "QWALLUserIsPrivat"
        static let is_Varify: String! = "QWALLUserIsverify"
        static let status: String! = "QWALLUserStatus"
        static let followers: String! = "QWALLUserIsfollower"
        static let following: String! = "QWALLUserIsfollowing"
        static let lastSynctime:String = "lastSynctime"
        static let lastSynctimeDelete:String = "lastSynctimeDelete"
        static let lastPageno:String = "lastPageno"
        static let DobDay:String = "DobDayUserLoggedin"
        static let DobMonth:String = "DobMonthUserLoggedin"
        static let DobYear:String = "DobYearUserLoggedin"
        static let refresh_token:String = "PhoneUserLoggedin"
    }
    
    static var isUpdating:Bool = false
    struct kLoggedInUserData {
        var status: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.status)
        var name: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.name)
        var IsLoggedIn: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.IsLoggedIn)
        var User_id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.User_id)
        var Email: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.Email)
        var rememPassword: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.rememPassword)
        var rememEmail: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.rememEmailornumber)
        var AccessToken: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.AccessToken)
        var refresh_token: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.refresh_token)
        var isRemembered: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.is_remembered)
        var company_access_code: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.company_access_code)
        var contact_id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.contact_id)
        var contact_pic: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.contact_pic)
        var first_name: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.FirstName)
        var last_name: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.LastName)
        //var id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.User_id)
        var is_details_updated: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.is_details_updated)
        var is_superuser: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.is_superuser)
        var license_master_id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.license_master_id)
        var onboarding_step: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.onboarding_step)
        var parent_login_id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.parent_login_id)
        var profile_contact_id: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.profile_contact_id)
        var role: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.RoleUser)
        var solution_no: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.SolutionNumber)
        var support_user_level: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.support_user_level)
        var user_roles: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.user_roles)
        var user_type: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.user_type)
        var DobDay: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.DobDay)
        var DobMonth: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.DobMonth)
        var DobYear: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.DobYear)
        var Phone: String? = Global.singleton.retriveFromUserDefaults(key: Global.kLoggedInUserKey.Phone)
    }
    

    
    // MARK: -  String Type for Validation
    enum kStringType : Int {
        case AlphaNumeric
        case AlphabetOnly
        case NumberOnly
        case Fullname
        case Username
        case Email
        case PhoneNumber
    }
    
    struct PhoneType {
        static let mobile: String = "mobile"
        static let home: String = "home"
        static let work: String = "work"
        static let fax: String = "fax"
        static let other: String = "other"
        
    }
    
    struct AddressType {
        
        static let home: String = "home"
        static let work: String = "work"
        static let billing: String = "billing"
        static let shipping: String = "shipping"
        static let other: String = "other"
        
    }
    
    // MARK: -  Post Media Type
    struct kGoogleApiKey {
        static let strPlaceAPIKey: String! = "AIzaSyCu-ZQpT7HFNUriHJ5pnAFkb0xuUZLusyY"
        
    }
    struct kGoogleApis {
        static let strContactApi = "https://www.googleapis.com/auth/contacts.readonly"
        
    }
    
    
    struct SocialKeys {
        static let facebook: String = "facebook"
        static let twitter: String  = "twitter"
        static let google: String = "google"
        static let skype: String = "skype"
        static let linkedin: String = "linkedin"
        static let website: String = "website"
    }
    
    struct DatesName {
        static let BirthDay: String = "birthday"
        
    }
    
    // MARK: -  Create Post: Text Theme Colors
    struct kTextThemeColor {
        static let Start_1 = Global().RGB(r: 248, g: 248, b: 141, a: 1).cgColor
        static let End_1 = Global().RGB(r: 248, g: 248, b: 141, a: 1).cgColor
        
        static let Start_2 = Global().RGB(r: 86, g: 229, b: 159, a: 1).cgColor
        static let End_2 = Global().RGB(r: 40, g: 187, b: 230, a: 1).cgColor
        
        static let Start_3 = Global().RGB(r: 74, g: 144, b: 226, a: 1).cgColor
        static let End_3 = Global().RGB(r: 74, g: 144, b: 226, a: 1).cgColor
        
        static let Start_4 = Global().RGB(r: 220, g: 56, b: 246, a: 1).cgColor
        static let End_4 = Global().RGB(r: 97, g: 63, b: 219, a: 1).cgColor
        
        static let Start_5 = Global().RGB(r: 243, g: 83, b: 105, a: 1).cgColor
        static let End_5 = Global().RGB(r: 243,g: 83, b: 105, a: 1).cgColor
        
        static let Start_6 = Global().RGB(r: 252, g: 209, b: 114, a: 1).cgColor
        static let End_6 = Global().RGB(r: 244, g: 89, b: 106, a: 1).cgColor
        
        static let Start_7 = Global().RGB(r: 137, g: 250, b: 147, a: 1).cgColor
        static let End_7 = Global().RGB(r: 137, g: 250, b: 147, a: 1).cgColor
        
        static let Start_8 = Global().RGB(r: 255, g: 150, b: 225, a: 1).cgColor
        static let End_8 = Global().RGB(r: 255, g: 150, b: 225, a: 1).cgColor
    }
}
