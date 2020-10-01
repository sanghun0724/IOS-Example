//
//  WeatherInformation.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/30.
//

import Foundation

struct  WeatherInformation:Codable{
    let korean_name:String
    let assets_name:String
    
    var name:String {return self.korean_name}
  
//    enum CodingKeys:String, CodingKey{
//        case name
//        case filename
//    }
}

