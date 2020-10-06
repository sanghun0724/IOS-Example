//
//  MyCountry.swift
//  WeatherToday
//
//  Created by sangheon on 2020/10/06.
//

import Foundation
struct MyCountry: Codable{
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey{
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
