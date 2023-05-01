//
//  DateConfiguration.swift
//  weatherProject
//
//  Created by Defne Çetiner on 1.05.2023.
//

import Foundation

/// API üzerinden gelen tarihi güne dönüştürür.
class DateConfiguration {
    
    // MARK: - Functions
    class func convertDateToDayName(date: String, identifier: String) -> String {
        var dayName: String!
        
        let dateFormatterForMainDate = DateFormatter()
        dateFormatterForMainDate.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterForDay = DateFormatter()
        dateFormatterForDay.dateFormat = identifier
        dateFormatterForDay.locale = Locale(identifier: "tr_TR")
        
        if let date = dateFormatterForMainDate.date(from: date) {
            dayName = dateFormatterForDay.string(from: date)
        } else {
            print("There was an error decoding the string")
        }
        
        return dayName
    }
}
