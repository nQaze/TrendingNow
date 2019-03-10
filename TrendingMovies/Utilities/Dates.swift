//
//  Dates.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

private let displayDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    return formatter
}()

private let apiDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

extension Date {
    
    public var displayDateString: String {
        return displayDateFormatter.string(from: self)
    }
    
    public var apiDateString: String? {
        return apiDateFormatter.string(from: self)
    }
    
    func toString( dateFormat format  : String ) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

extension String {
    
    public var displayDate: Date? {
        return displayDateFormatter.date(from: self)
    }
    
    public var apiDate: Date? {
        return apiDateFormatter.date(from: self)
    }
    
    public var displayDateString : String {
        if let date = self.apiDate{
            return date.displayDateString
        }
        return ""
    }
    
}
