//
//  WeatherInformation.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/30.
//

import Foundation
//{
//   "city_name":"뉴욕",
//   "state":10,
//   "celsius":-2.6,
//   "rainfall_probability":0
//},
struct WeatherInformation: Codable {
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state
        case celsius
        case rainfallProbability = "rainfall_probability"
    }
}
    

    


