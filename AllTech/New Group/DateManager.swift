//
//  DateManager.swift
//  TestingApp
//
//  Created by Harish Kumar11 on 05/07/18.
//  Copyright © 2018 Harish Kumar11. All rights reserved.
//

import UIKit

class DateManager: NSObject {

   class func methodDateFromString(stringDate:String)->NSDate{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: stringDate)
        return date! as NSDate
    }
    
    class func methodStringFromDate(dateFromString:NSDate)->String{

    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale
    dateFormatter.dateFormat = "MMMM dd yyyy HH:mm:ss"
    dateFormatter.locale = tempLocale // reset the locale
    let dateString = dateFormatter.string(from: dateFromString as Date)
    
        return dateString
        
    }
    
    //        let now = Date()
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "MMMM dd yyyy\nH:mm:ss"
    //        cell.publishedLabel.text = dateFormatter.string(from: now)
    
    //USAGE
    //"MMMM dd yyyy\nH:mm:ss"
    
    
//    let stringDateFormServer:String = article[indexPath.row].publishedAt
//    let dateToShowOnUI:String =  DateManager.methodStringFromDate(dateFromString: DateManager.methodDateFromString(stringDate: stringDateFormServer) as NSDate)
//    cell.publishedLabel.text = dateToShowOnUI
    
}
