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
struct  WeatherInformation: Codable{
    
    var korean_name:String?
    var asset_name:String?
    var city_name:String?
    var state:Int? //이거에 따라 이미지 넣으면댐
    var celsius:Int? //화씨랑 섭씨 계산
    var rainfall_probability:Int?
    
//    enum CodingKeys:String,CodingKey {
//        case koreanName = "korean_name"
//        case assetName = "asset_name"
//        case cityName = "city_name"
//        case state
//        case celsius
//        case rainfallProbability = "rainfall_probability"
//
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        if let koreanName = try container.decode(String?.self, forKey: .koreanName){
//            self.koreanName = koreanName
//        }
//        if let assetName = try container.decode(String?.self,forKey: .assetName){
//            self.assetName = assetName
//        }
//        if let cityName = try container.decode(String?.self,forKey: .cityName){
//            self.cityName = cityName
//        }
//        if let state = try container.decode(Int?.self,forKey: .state){
//            self.state = state
//        }
//        if let celsius = try container.decode(Int?.self,forKey: .celsius){
//            self.celsius = celsius
//        }
//        if let rainfallProbability = try container.decode(Int?.self,forKey: .rainfallProbability){
//            self.rainfallProbability = rainfallProbability
//        }
//
//    }
//
    
    
    
    
}

