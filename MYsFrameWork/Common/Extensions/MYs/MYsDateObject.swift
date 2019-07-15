//
//  MYsDateObject.swift
//  MYsFrameWork
//
//  Created by mahdi yousefpour on 6/20/17.
//  Copyright © 2017 mahdi yousefpour. All rights reserved.
//

import UIKit

class MYsDateObject: NSObject {
    
}

public extension Date {
    
    // MARK: Custom Method
    
    func toDateString()-> String{
        let day  = self.day < 10 ? "0\(self.day)" : "\(self.day)"
        let month  = self.month < 10 ? "0\(self.month)" : "\(self.month)"
        return "\(self.year)/\(month)/\(day)"
    }
    
    func toDateInt()-> Int{
        let day  = self.day < 10 ? "0\(self.day)" : "\(self.day)"
        let month  = self.month < 10 ? "0\(self.month)" : "\(self.month)"
        return "\(self.year)\(month)\(day)".ToInt()
    }

    func isSmaller(than:Date)->Bool{
        if self.year < than.year {
            return true
        }else if self.month < than.month{
            return true
        }else if self.day < than.day{
            return true
        }
        return false
    }

    func isBigger(than:Date)->Bool{
        if self.year > than.year {
            return true
        }else if self.month > than.month{
            return true
        }else if self.day > than.day{
            return true
        }
        return false
    }

    
    func getCurrentDate()-> Date {
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.hour = Calendar.current.component(.hour, from: now)
        nowComponents.minute = Calendar.current.component(.minute, from: now)
        nowComponents.second = Calendar.current.component(.second, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        return now as Date
    }
    
    
    
    /*
     Initializes a new Date() objext based on a date string, format, optional timezone and optional locale.
     
     - Returns: A Date() object if successfully converted from string or nil.
     */
    init?(fromString string: String, format:DateFormatType, timeZone: TimeZoneType = .local, locale: Locale = Foundation.Locale.current) {
        guard !string.isEmpty else {
            return nil
        }
        var string = string
        switch format {
        case .dotNet:
            let pattern = "\\\\?/Date\\((\\d+)(([+-]\\d{2})(\\d{2}))?\\)\\\\?/"
            let regex = try! NSRegularExpression(pattern: pattern)
            guard let match = regex.firstMatch(in: string, range: NSRange(location: 0, length: string.utf16.count)) else {
                return nil
            }
            let dateString = (string as NSString).substring(with: match.range(at: 1))
            let interval = Double(dateString)! / 1000.0
            self.init(timeIntervalSince1970: interval)
            return
        case .rss, .altRSS:
            if string.hasSuffix("Z") {
                string = string.substring(to: string.index(string.endIndex, offsetBy: -1)).appending("GMT")
            }
        default:
            break
        }
        let formatter = Date.cachedFormatter(format.stringFormat, timeZone: timeZone.timeZone, locale: locale)
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval:0, since:date)
    }
    
    // MARK: Convert to String
    
    
    /// Converts the date to string based on a date format, optional timezone and optional locale.
    func toString(format: DateFormatType, timeZone: TimeZoneType = .local, locale: Locale = Locale.current) -> String {
        switch format {
        case .dotNet:
            let offset = Foundation.NSTimeZone.default.secondsFromGMT() / 3600
            let nowMillis = 1000 * self.timeIntervalSince1970
            return String(format: format.stringFormat, nowMillis, offset)
        default:
            break
        }
        let formatter = Date.cachedFormatter(format.stringFormat, timeZone: timeZone.timeZone, locale: locale)
        return formatter.string(from: self)
    }
    

    
    /// Converts the date to string based on DateFormatter's date style and time style with optional relative date formatting, optional time zone and optional locale.
    func toString(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style, isRelative: Bool = false, timeZone: Foundation.TimeZone = Foundation.NSTimeZone.local, locale: Locale = Locale.current) -> String {
        let formatter = Date.cachedFormatter(dateStyle, timeStyle: timeStyle, doesRelativeDateFormatting: isRelative, timeZone: timeZone, locale: locale)
        return formatter.string(from: self)
    }
    
    
//    /// Converts the date to string based on a relative time language. i.e. just now, 1 minute ago etc...
//    func toStringWithRelativeTime(strings:[RelativeTimeStringType:String]? = nil) -> String {
//        
//        let time = self.timeIntervalSince1970
//        let now = Date().timeIntervalSince1970
//        let isPast = now - time > 0
//        
//        let sec:Double = abs(now - time)
//        let min:Double = round(sec/60)
//        let hr:Double = round(min/60)
//        let d:Double = round(hr/24)
//        
//        
//        if sec < 60 {
//            if sec < 10 {
//                if isPast {
//                    return strings?[.nowPast] ?? NSLocalizedString("just now", comment: "Date format")
//                } else {
//                    return strings?[.nowFuture] ?? NSLocalizedString("in a few seconds", comment: "Date format")
//                }
//            } else {
//                let string:String
//                if isPast {
//                    string = strings?[.secondsPast] ?? NSLocalizedString("%.f seconds ago", comment: "Date format")
//                } else {
//                    string = strings?[.secondsFuture] ?? NSLocalizedString("in %.f seconds", comment: "Date format")
//                }
//                return String(format: string, sec)
//            }
//        }
//        if min < 60 {
//            if min == 1 {
//                if isPast {
//                    return strings?[.oneMinutePast] ?? NSLocalizedString("1 minute ago", comment: "Date format")
//                } else {
//                    return strings?[.oneMinuteFuture] ?? NSLocalizedString("in 1 minute", comment: "Date format")
//                }
//            } else {
//                let string:String
//                if isPast {
//                    string = strings?[.minutesPast] ?? NSLocalizedString("%.f minutes ago", comment: "Date format")
//                } else {
//                    string = strings?[.minutesFuture] ?? NSLocalizedString("in %.f minutes", comment: "Date format")
//                }
//                return String(format: string, min)
//            }
//        }
//        if hr < 24 {
//            if hr == 1 {
//                if isPast {
//                    return strings?[.oneHourPast] ?? NSLocalizedString("last hour", comment: "Date format")
//                } else {
//                    return strings?[.oneHourFuture] ?? NSLocalizedString("next hour", comment: "Date format")
//                }
//            } else {
//                let string:String
//                if isPast {
//                    string = strings?[.hoursPast] ?? NSLocalizedString("%.f hours ago", comment: "Date format")
//                } else {
//                    string = strings?[.hoursFuture] ?? NSLocalizedString("in %.f hours", comment: "Date format")
//                }
//                return String(format: string, hr)
//            }
//        }
//        if d < 7 {
//            if d == 1 {
//                if isPast {
//                    return strings?[.oneDayPast] ?? NSLocalizedString("yesterday", comment: "Date format")
//                } else {
//                    return strings?[.oneDayFuture] ?? NSLocalizedString("tomorrow", comment: "Date format")
//                }
//            } else {
//                let string:String
//                if isPast {
//                    string = strings?[.daysPast] ?? NSLocalizedString("%.f days ago", comment: "Date format")
//                } else {
//                    string = strings?[.daysFuture] ?? NSLocalizedString("in %.f days", comment: "Date format")
//                }
//                return String(format: string, d)
//            }
//        }
//        if d < 28 {
//            if isPast {
//                if compare(.isLastWeek) {
//                    return strings?[.oneWeekPast] ?? NSLocalizedString("last week", comment: "Date format")
//                } else {
//                    let string = strings?[.weeksPast] ?? NSLocalizedString("%.f weeks ago", comment: "Date format")
//                    return String(format: string, Double(abs(since(Date(), in: .week))))
//                }
//            } else {
//                if compare(.isNextWeek) {
//                    return strings?[.oneWeekFuture] ?? NSLocalizedString("next week", comment: "Date format")
//                } else {
//                    let string = strings?[.weeksFuture] ?? NSLocalizedString("in %.f weeks", comment: "Date format")
//                    return String(format: string, Double(abs(since(Date(), in: .week))))
//                }
//            }
//        }
//        if compare(.isThisYear) {
//            if isPast {
//                if compare(.isLastMonth) {
//                    return strings?[.oneMonthPast] ?? NSLocalizedString("last month", comment: "Date format")
//                } else {
//                    let string = strings?[.monthsPast] ?? NSLocalizedString("%.f months ago", comment: "Date format")
//                    return String(format: string, Double(abs(since(Date(), in: .month))))
//                }
//            } else {
//                if compare(.isNextMonth) {
//                    return strings?[.oneMonthFuture] ?? NSLocalizedString("next month", comment: "Date format")
//                } else {
//                    let string = strings?[.monthsFuture] ?? NSLocalizedString("in %.f months", comment: "Date format")
//                    return String(format: string, Double(abs(since(Date(), in: .month))))
//                }
//            }
//        }
//        if isPast {
//            if compare(.isLastYear) {
//                return strings?[.oneYearPast] ?? NSLocalizedString("last year", comment: "Date format")
//            } else {
//                let string = strings?[.yearsPast] ?? NSLocalizedString("%.f years ago", comment: "Date format")
//                return String(format: string, Double(abs(since(Date(), in: .year))))
//            }
//        } else {
//            if compare(.isNextYear) {
//                return strings?[.oneYearFuture] ?? NSLocalizedString("next year", comment: "Date format")
//            } else {
//                let string = strings?[.yearsFuture] ?? NSLocalizedString("in %.f years", comment: "Date format")
//                return String(format: string, Double(abs(since(Date(), in: .year))))
//            }
//        }
//    }
    
    
    // MARK: Compare Dates
    
//    /// Compares dates to see if they are equal while ignoring time.
//    func compare(_ comparison:DateComparisonType) -> Bool {
//        switch comparison {
//        case .isToday:
//            return compare(.isSameDay(as: Date()))
//        case .isTomorrow:
//            let comparison = Date().adjust(.day, offset:1)
//            return compare(.isSameDay(as: comparison))
//        case .isYesterday:
//            let comparison = Date().adjust(.day, offset: -1)
//            return compare(.isSameDay(as: comparison))
//        case .isSameDay(let date):
//            return component(.year) == date.component(.year)
//                && component(.month) == date.component(.month)
//                && component(.day) == date.component(.day)
//        case .isThisWeek:
//            return self.compare(.isSameWeek(as: Date()))
//        case .isNextWeek:
//            let comparison = Date().adjust(.week, offset:1)
//            return compare(.isSameWeek(as: comparison))
//        case .isLastWeek:
//            let comparison = Date().adjust(.week, offset:-1)
//            return compare(.isSameWeek(as: comparison))
//        case .isSameWeek(let date):
//            if component(.week) != date.component(.week) {
//                return false
//            }
//            // Ensure time interval is under 1 week
//            return abs(self.timeIntervalSince(date)) < Date.weekInSeconds
//        case .isThisMonth:
//            return self.compare(.isSameMonth(as: Date()))
//        case .isNextMonth:
//            let comparison = Date().adjust(.month, offset:1)
//            return compare(.isSameMonth(as: comparison))
//        case .isLastMonth:
//            let comparison = Date().adjust(.month, offset:-1)
//            return compare(.isSameMonth(as: comparison))
//        case .isSameMonth(let date):
//            return component(.year) == date.component(.year) && component(.month) == date.component(.month)
//        case .isThisYear:
//            return self.compare(.isSameYear(as: Date()))
//        case .isNextYear:
//            let comparison = Date().adjust(.year, offset:1)
//            return compare(.isSameYear(as: comparison))
//        case .isLastYear:
//            let comparison = Date().adjust(.year, offset:-1)
//            return compare(.isSameYear(as: comparison))
//        case .isSameYear(let date):
//            return component(.year) == date.component(.year)
//        case .isInTheFuture:
//            return self.compare(.isLater(than: Date()))
//        case .isInThePast:
//            return self.compare(.isEarlier(than: Date()))
//        case .isEarlier(let date):
//            return (self as NSDate).earlierDate(date) == self
//        case .isLater(let date):
//            return (self as NSDate).laterDate(date) == self
//        case .isWeekday:
//            return !compare(.isWeekend)
//        case .isWeekend:
//            let range = Calendar.current.maximumRange(of: Calendar.Component.weekday)!
//            return (component(.weekday) == range.lowerBound || component(.weekday) == range.upperBound - range.lowerBound)
//        }
//
//    }
//    
    
    // MARK: Adjust dates
    
    /// Creates a new date with adjusted components
    
    func adjust(_ component:DateComponentType, offset:Int) -> Date {
        var dateComp = DateComponents()
        switch component {
        case .second:
            dateComp.second = offset
        case .minute:
            dateComp.minute = offset
        case .hour:
            dateComp.hour = offset
        case .day:
            dateComp.day = offset
        case .weekday:
            dateComp.weekday = offset
        case .nthWeekday:
            dateComp.weekdayOrdinal = offset
        case .week:
            dateComp.weekOfYear = offset
        case .month:
            dateComp.month = offset
        case .year:
            dateComp.year = offset
        }
        return Calendar.current.date(byAdding: dateComp, to: self)!
    }
    
    /// Return a new Date object with the new hour, minute and seconds values.
    func adjust(hour: Int?, minute: Int?, second: Int?, day: Int? = nil, month: Int? = nil) -> Date {
        var comp = Date.components(self)
        comp.month = month ?? comp.month
        comp.day = day ?? comp.day
        comp.hour = hour ?? comp.hour
        comp.minute = minute ?? comp.minute
        comp.second = second ?? comp.second
        return Calendar.current.date(from: comp)!
    }
    
    func adjust(hour: Int?, minute: Int?, second: Int?, day: Int? = nil, month: Int? = nil, year: Int? = nil) -> Date {
        var comp = Date.components(self)
        comp.year = year ?? comp.year
        comp.month = month ?? comp.month
        comp.day = day ?? comp.day
        comp.hour = hour ?? comp.hour
        comp.minute = minute ?? comp.minute
        comp.second = second ?? comp.second
        return Calendar.current.date(from: comp)!
    }
    
    func adjust(day: Int, month: Int, year: Int) -> Date {
        var dateComponent = DateComponents()
        dateComponent.month = month
        dateComponent.day = day
        dateComponent.year = year
        return Calendar.current.date(byAdding: dateComponent, to: self)!
    }
    
    // MARK: Date for...
    
//    func dateFor(_ type:DateForType) -> Date {
//        switch type {
//        case .startOfDay:
//            return adjust(hour: 0, minute: 0, second: 0)
//        case .endOfDay:
//            return adjust(hour: 23, minute: 59, second: 59)
//        case .startOfWeek:
//            let offset = component(.weekday)!-1
//            return adjust(.day, offset: -(offset))
//        case .endOfWeek:
//            let offset = 7 - component(.weekday)!
//            return adjust(.day, offset: offset)
//        case .startOfMonth:
//            return adjust(hour: 0, minute: 0, second: 0, day: 1)
//        case .endOfMonth:
//            let month = (component(.month) ?? 0) + 1
//            return adjust(hour: 0, minute: 0, second: 0, day: 0, month: month)
//        case .tomorrow:
//            return adjust(.day, offset:1)
//        case .yesterday:
//            return adjust(.day, offset:-1)
//        case .nearestMinute(let nearest):
//            let minutes = (component(.minute)! + nearest/2) / nearest * nearest
//            return adjust(hour: nil, minute: minutes, second: nil)
//        case .nearestHour(let nearest):
//            let hours = (component(.hour)! + nearest/2) / nearest * nearest
//            return adjust(hour: hours, minute: 0, second: nil)
//        }
//    }
    
    // MARK: Time since...
    
    func since(_ date:Date, in component:DateComponentType) -> Int64 {
        switch component {
        case .second:
            return Int64(timeIntervalSince(date))
        case .minute:
            let interval = timeIntervalSince(date)
            return Int64(interval / Date.minuteInSeconds)
        case .hour:
            let interval = timeIntervalSince(date)
            return Int64(interval / Date.hourInSeconds)
        case .day:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .day, in: .era, for: self)
            let start = calendar.ordinality(of: .day, in: .era, for: date)
            return Int64(end! - start!)
        case .weekday:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekday, in: .era, for: self)
            let start = calendar.ordinality(of: .weekday, in: .era, for: date)
            return Int64(end! - start!)
        case .nthWeekday:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekdayOrdinal, in: .era, for: self)
            let start = calendar.ordinality(of: .weekdayOrdinal, in: .era, for: date)
            return Int64(end! - start!)
        case .week:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekOfYear, in: .era, for: self)
            let start = calendar.ordinality(of: .weekOfYear, in: .era, for: date)
            return Int64(end! - start!)
        case .month:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .month, in: .era, for: self)
            let start = calendar.ordinality(of: .month, in: .era, for: date)
            return Int64(end! - start!)
        case .year:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .year, in: .era, for: self)
            let start = calendar.ordinality(of: .year, in: .era, for: date)
            return Int64(end! - start!)
            
        }
    }
    
    
    // MARK: Extracting components
    
    func component(_ component:DateComponentType) -> Int? {
        let components = Date.components(self)
        switch component {
        case .second:
            return components.second
        case .minute:
            return components.minute
        case .hour:
            return components.hour
        case .day:
            return components.day
        case .weekday:
            return components.weekday
        case .nthWeekday:
            return components.weekdayOrdinal
        case .week:
            return components.weekOfYear
        case .month:
            return components.month
        case .year:
            return components.year
        }
    }
    
    func numberOfDaysInMonth() -> Int {
        let range = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: self)!
        return range.upperBound - range.lowerBound
    }
    
    func firstDayOfWeek() -> Int {
        let distanceToStartOfWeek = Date.dayInSeconds * Double(self.component(.weekday)! - 1)
        let interval: TimeInterval = self.timeIntervalSinceReferenceDate - distanceToStartOfWeek
        return Date(timeIntervalSinceReferenceDate: interval).component(.day)!
    }
    
    func lastDayOfWeek() -> Int {
        let distanceToStartOfWeek = Date.dayInSeconds * Double(self.component(.weekday)! - 1)
        let distanceToEndOfWeek = Date.dayInSeconds * Double(7)
        let interval: TimeInterval = self.timeIntervalSinceReferenceDate - distanceToStartOfWeek + distanceToEndOfWeek
        return Date(timeIntervalSinceReferenceDate: interval).component(.day)!
    }
    
    
    // MARK: Internal Components
    
    internal static func componentFlags() -> Set<Calendar.Component> { return [Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.weekday, Calendar.Component.weekdayOrdinal, Calendar.Component.weekOfYear] }
    internal static func components(_ fromDate: Date) -> DateComponents {
        return Calendar.current.dateComponents(Date.componentFlags(), from: fromDate)
    }
    
    
    // MARK: Static Cached Formatters
    
    /// A cached static array of DateFormatters so that thy are only created once.
    private static func cachedDateFormatters() -> [String: DateFormatter] {
        struct Static {
            static var formatters: [String: DateFormatter]? = [String: DateFormatter]()
        }
        return Static.formatters!
    }
    
    private static func cachedOrdinalNumberFormatter() -> NumberFormatter {
        struct Static {
            static var numberFormatter = NumberFormatter()
        }
        if #available(iOSApplicationExtension 9.0, *) {
            Static.numberFormatter.numberStyle = .ordinal
        }
        return Static.numberFormatter
    }
    
    /// Generates a cached formatter based on the specified format, timeZone and locale. Formatters are cached in a singleton array using hashkeys.
    private static func cachedFormatter(_ format:String = DateFormatType.standard.stringFormat, timeZone: Foundation.TimeZone = Foundation.TimeZone.current, locale: Locale = Locale.current) -> DateFormatter {
        let hashKey = "\(format.hashValue)\(timeZone.hashValue)\(locale.hashValue)"
        var formatters = Date.cachedDateFormatters()
        if let cachedDateFormatter = formatters[hashKey] {
            return cachedDateFormatter
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.timeZone = timeZone
            formatter.locale = locale
            formatters[hashKey] = formatter
            return formatter
        }
    }
    
    /// Generates a cached formatter based on the provided date style, time style and relative date. Formatters are cached in a singleton array using hashkeys.
    private static func cachedFormatter(_ dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style, doesRelativeDateFormatting: Bool, timeZone: Foundation.TimeZone = Foundation.NSTimeZone.local, locale: Locale = Locale.current) -> DateFormatter {
        var formatters = Date.cachedDateFormatters()
        let hashKey = "\(dateStyle.hashValue)\(timeStyle.hashValue)\(doesRelativeDateFormatting.hashValue)\(timeZone.hashValue)\(locale.hashValue)"
        if let cachedDateFormatter = formatters[hashKey] {
            return cachedDateFormatter
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = dateStyle
            formatter.timeStyle = timeStyle
            formatter.doesRelativeDateFormatting = doesRelativeDateFormatting
            formatter.timeZone = timeZone
            formatter.locale = locale
            formatters[hashKey] = formatter
            return formatter
        }
    }
    
    // MARK: Intervals In Seconds
    internal static let minuteInSeconds:Double = 60
    internal static let hourInSeconds:Double = 3600
    internal static let dayInSeconds:Double = 86400
    internal static let weekInSeconds:Double = 604800
    internal static let yearInSeconds:Double = 31556926
    
    
    
    
    
    func GregorianToPersianDateTime()->String{
        let formatter = DateFormatter()
        //formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = DateFormatter.Style.full
        formatter.calendar = Calendar(identifier: .gregorian)
        //        let dateInGrogrian = formatter.string(from: date)
        //        print(dateInGrogrian)
        
        formatter.calendar = Calendar(identifier: .persian)
        //formatter.dateStyle = DateFormatter.Style.full
        formatter.dateFormat = "yyyy/MM/dd - HH:mm:ss"
        return formatter.string(from: self)
    }
    
    func GregorianToPersianDateMin()->String{
        let dateFormatter = DateFormatter()
        let dateFormatterEN = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa_IR")
        dateFormatterEN.dateFormat = "YYYY-MM-dd HH:mm:ssZ"
        dateFormatter.dateFormat = "YYYY/MM/dd - HH:mm:ss"
        let enDate = dateFormatterEN.date(from: self.description)
        if(enDate != nil){
            return dateFormatter.string(from: enDate!)
        }else{
            return self.description
        }
    }
    
    func GregorianToPersianTime()->String{
        let formatter = DateFormatter()
        //formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = DateFormatter.Style.full
        formatter.calendar = Calendar(identifier: .gregorian)
        //        let dateInGrogrian = formatter.string(from: date)
        //        print(dateInGrogrian)
        
        formatter.calendar = Calendar(identifier: .persian)
        //formatter.dateStyle = DateFormatter.Style.full
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: self)
    }
    
    func GregorianToPersianDate()->String{
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.full
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: self)
    }
    
    func GregorianToPersianDateArray()->[String]{
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.full
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "yyyy/MM/dd"
        let year = formatter.string(from: self).subString(offSet: 0, length: 4)!
        let month = formatter.string(from: self).subString(offSet: 5, length: 2)!
        let day = formatter.string(from: self).subString(offSet: 8, length: 2)!
        return [year, month, day]
    }
    
   func timeAgoSinceDate(numericDates:Bool) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = self < now ? self : now
        let latest =  self > now ? self : now
        
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfMonth, .month, .year, .second]
        let components: DateComponents = calendar.dateComponents(unitFlags, from: earliest, to: latest)
        
        if let year = components.year {
            if (year >= 2) {
                return "\(year) years ago"
            } else if (year >= 1) {
                return stringToReturn(flag: numericDates, strings: ("1 year ago", "Last year"))
            }
        }
        
        if let month = components.month {
            if (month >= 2) {
                return "\(month) months ago"
            } else if (month >= 2) {
                return stringToReturn(flag: numericDates, strings: ("1 month ago", "Last month"))
            }
        }
        
        if let weekOfYear = components.weekOfYear {
            if (weekOfYear >= 2) {
                return "\(weekOfYear) months ago"
            } else if (weekOfYear >= 2) {
                return stringToReturn(flag: numericDates, strings: ("1 week ago", "Last week"))
            }
        }
        
        if let day = components.day {
            if (day >= 2) {
                return "\(day) days ago"
            } else if (day >= 2) {
                return stringToReturn(flag: numericDates, strings: ("1 day ago", "Yesterday"))
            }
        }
        
        if let hour = components.hour {
            if (hour >= 2) {
                return "\(hour) hours ago"
            } else if (hour >= 2) {
                return stringToReturn(flag: numericDates, strings: ("1 hour ago", "An hour ago"))
            }
        }
        
        if let minute = components.minute {
            if (minute >= 2) {
                return "\(minute) minutes ago"
            } else if (minute >= 2) {
                return stringToReturn(flag: numericDates, strings: ("1 minute ago", "A minute ago"))
            }
        }
        
        if let second = components.second {
            if (second >= 3) {
                return "\(second) seconds ago"
            }
        }
        
        return "Just now"
    }
    
    private func stringToReturn(flag:Bool, strings: (String, String)) -> String {
        if (flag){
            return strings.0
        } else {
            return strings.1
        }
    }
}

// MARK: Enums used


/**
 The string format used for date string conversion.
 
 ````
 case isoYear: i.e. 1997
 case isoYearMonth: i.e. 1997-07
 case isoDate: i.e. 1997-07-16
 case isoDateTime: i.e. 1997-07-16T19:20+01:00
 case isoDateTimeSec: i.e. 1997-07-16T19:20:30+01:00
 case isoDateTimeMilliSec: i.e. 1997-07-16T19:20:30.45+01:00
 case dotNet: i.e. "/Date(1268123281843)/"
 case rss: i.e. "Fri, 09 Sep 2011 15:26:08 +0200"
 case altRSS: i.e. "09 Sep 2011 15:26:08 +0200"
 case httpHeader: i.e. "Tue, 15 Nov 1994 12:45:26 GMT"
 case standard: "EEE MMM dd HH:mm:ss Z yyyy"
 case custom(String): a custom date format string
 ````
 
 */
public enum DateFormatType {
    
    /// The ISO8601 formatted year "yyyy" i.e. 1997
    case isoYear
    
    /// The ISO8601 formatted year and month "yyyy-MM" i.e. 1997-07
    case isoYearMonth
    
    /// The ISO8601 formatted date "yyyy-MM-dd" i.e. 1997-07-16
    case isoDate
    
    /// The ISO8601 formatted date and time "yyyy-MM-dd'T'HH:mmZ" i.e. 1997-07-16T19:20+01:00
    case isoDateTime
    
    /// The ISO8601 formatted date, time and sec "yyyy-MM-dd'T'HH:mm:ssZ" i.e. 1997-07-16T19:20:30+01:00
    case isoDateTimeSec
    
    /// The ISO8601 formatted date, time and millisec "yyyy-MM-dd'T'HH:mm:ss.SSSZ" i.e. 1997-07-16T19:20:30.45+01:00
    case isoDateTimeMilliSec
    
    /// The dotNet formatted date "/Date(%d%d)/" i.e. "/Date(1268123281843)/"
    case dotNet
    
    /// The RSS formatted date "EEE, d MMM yyyy HH:mm:ss ZZZ" i.e. "Fri, 09 Sep 2011 15:26:08 +0200"
    case rss
    
    /// The Alternative RSS formatted date "d MMM yyyy HH:mm:ss ZZZ" i.e. "09 Sep 2011 15:26:08 +0200"
    case altRSS
    
    /// The http header formatted date "EEE, dd MM yyyy HH:mm:ss ZZZ" i.e. "Tue, 15 Nov 1994 12:45:26 GMT"
    case httpHeader
    
    /// A generic standard format date i.e. "EEE MMM dd HH:mm:ss Z yyyy"
    case standard
    
    /// A custom date format string
    case custom(String)
    
    var stringFormat:String {
        switch self {
        case .isoYear: return "yyyy"
        case .isoYearMonth: return "yyyy-MM"
        case .isoDate: return "yyyy-MM-dd"
        case .isoDateTime: return "yyyy-MM-dd'T'HH:mmZ"
        case .isoDateTimeSec: return "yyyy-MM-dd'T'HH:mm:ssZ"
        case .isoDateTimeMilliSec: return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case .dotNet: return "/Date(%d%f)/"
        case .rss: return "EEE, d MMM yyyy HH:mm:ss ZZZ"
        case .altRSS: return "d MMM yyyy HH:mm:ss ZZZ"
        case .httpHeader: return "EEE, dd MM yyyy HH:mm:ss ZZZ"
        case .standard: return "EEE MMM dd HH:mm:ss Z yyyy"
        case .custom(let customFormat): return customFormat
        }
    }
}

/// The time zone to be used for date conversion
public enum TimeZoneType {
    case local, utc
    var timeZone:TimeZone {
        switch self {
        case .local: return NSTimeZone.local
        case .utc: return TimeZone(secondsFromGMT: 0)!
        }
    }
}

// The string keys to modify the strings in relative format
public enum RelativeTimeStringType {
    case nowPast, nowFuture, secondsPast, secondsFuture, oneMinutePast, oneMinuteFuture, minutesPast, minutesFuture, oneHourPast, oneHourFuture, hoursPast, hoursFuture, oneDayPast, oneDayFuture, daysPast, daysFuture, oneWeekPast, oneWeekFuture, weeksPast, weeksFuture, oneMonthPast, oneMonthFuture, monthsPast, monthsFuture, oneYearPast, oneYearFuture, yearsPast, yearsFuture
}

//// The type of comparison to do against today's date or with the suplied date.
//public enum DateComparisonType {
//
//    // Days
//
//    /// Checks if date today.
//    case isToday
//    /// Checks if date is tomorrow.
//    case isTomorrow
//    /// Checks if date is yesterday.
//    case isYesterday
//    /// Compares date days
//    case isSameDay(as:Date)
//
//    // Weeks
//
//    /// Checks if date is in this week.
//    case isThisWeek
//    /// Checks if date is in next week.
//    case isNextWeek
//    /// Checks if date is in last week.
//    case isLastWeek
//    /// Compares date weeks
//    case isSameWeek(as:Date)
//
//    // Months
//
//    /// Checks if date is in this month.
//    case isThisMonth
//    /// Checks if date is in next month.
//    case isNextMonth
//    /// Checks if date is in last month.
//    case isLastMonth
//    /// Compares date months
//    case isSameMonth(as:Date)
//
//    // Years
//
//    /// Checks if date is in this year.
//    case isThisYear
//    /// Checks if date is in next year.
//    case isNextYear
//    /// Checks if date is in last year.
//    case isLastYear
//    /// Compare date years
//    case isSameYear(as:Date)
//
//    // Relative Time
//
//    /// Checks if it's a future date
//    case isInTheFuture
//    /// Checks if the date has passed
//    case isInThePast
//    /// Checks if earlier than date
//    case isEarlier(than:Date)
//    /// Checks if later than date
//    case isLater(than:Date)
//    /// Checks if it's a weekday
//    case isWeekday
//    /// Checks if it's a weekend
//    case isWeekend
//
//}

// The date components available to be retrieved or modifed
public enum DateComponentType {
    case second, minute, hour, day, weekday, nthWeekday, week, month, year
}


// The type of date that can be used for the dateFor function.
public enum DateForType {
    case startOfDay, endOfDay, startOfWeek, endOfWeek, startOfMonth, endOfMonth, tomorrow, yesterday, nearestMinute(minute:Int), nearestHour(hour:Int)
}

// Convenience types for date to string conversion
public enum DateStyleType {
    /// Short style: "2/27/17, 2:22 PM"
    case short
    /// Medium style: "Feb 27, 2017, 2:22:06 PM"
    case medium
    /// Long style: "February 27, 2017 at 2:22:06 PM EST"
    case long
    /// Full style: "Monday, February 27, 2017 at 2:22:06 PM Eastern Standard Time"
    case full
    /// Ordinal day: "27th"
    case ordinalDay
    /// Weekday: "Monday"
    case weekday
    /// Short week day: "Mon"
    case shortWeekday
    /// Very short weekday: "M"
    case veryShortWeekday
    /// Month: "February"
    case month
    /// Short month: "Feb"
    case shortMonth
    /// Very short month: "F"
    case veryShortMonth
}

// MARK: - Persian Month
public extension Date {
    
    func persianMonthName() -> String{
        switch self.monthName().lowercased() {
        case "january":
            return "دی"
        case "february":
            return "بهمن"
        case "march":
            return "اسفند"
        case "april":
            return "فروردین"
        case "may":
            return "اردیبهشت"
        case "june":
            return "خرداد"
        case "july":
            return "تیر"
        case "august":
            return "مرداد"
        case "september":
            return "شهریور"
        case "october":
            return "مهر"
        case "november":
            return "آبان"
        case "december":
            return "آذر"
        default:
            return ""
        }
    }
    
}
