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
        let state:Int //이거에 따라 이미지 넣으면댐
        let celsius:Int //화씨랑 섭씨 계산해야대
        let rainfall_probability:Int
    }
    
  
    
}

