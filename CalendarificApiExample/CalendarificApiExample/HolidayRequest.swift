//
//  HolidayRequest.swift
//  CalendarificApiExample
//
//  Created by Dmitry Belyaev on 23/10/2019.
//  Copyright © 2019 Dmitry Belyaev. All rights reserved.
//

import Foundation

enum HolidayError: Error {
    case noDatavailable
    case canNotProcessData 
}

struct HolidayRequest {
    let resourceURL: URL
    let API_KEY = "7631c40846b7c355aea50afab08b420ddf5f6ca2"
    
    init(countryCode: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        
        self.resourceURL = resourceURL
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data,_,_ in
            guard let jsonData = data else {
                completion(.failure(HolidayError.noDatavailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponse.response.holidays
                completion(.success(holidayDetails))
            } catch {
                completion(.failure(HolidayError.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
