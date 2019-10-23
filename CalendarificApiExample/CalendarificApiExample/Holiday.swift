//
//  Holiday.swift
//  CalendarificApiExample
//
//  Created by Dmitry Belyaev on 23/10/2019.
//  Copyright © 2019 Dmitry Belyaev. All rights reserved.
//

import Foundation

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name: String
    var date: DateInfo
    
}

struct DateInfo: Decodable {
    var iso: String
}
