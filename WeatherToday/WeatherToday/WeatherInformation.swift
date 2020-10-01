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
struct  WeatherInformation:Codable{
    
    let korean_name:String
    let asset_name:String
    
    
    struct countryInfo :Codable {
        let city_name:String
        let state:Int
        let celsius:Int
        let rainfall_probability:Int
    }
    
  
    
}

