//
//  ThirdView.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/30.
//

import UIKit

class ThirdView:UIViewController {
    
    var setCelsius: Double?
    var setRain:Int?
    var setState:Int?
    var titleName: String?
    
    @IBOutlet var first:UILabel!
    @IBOutlet var twice:UILabel!
    @IBOutlet var third:UILabel!
    @IBOutlet var big:UIImageView!
    
    override func viewDidLoad() {
        let Answer: Double = floor((setCelsius! * 1.8 + 32) * 100) / 100
        self.navigationItem.title = titleName!
        
        twice.text = "섭씨 \(setCelsius!)도 / 화씨 \(Answer)도"
        third.text = "강수확률 \(setRain!)%"
        switch setState{
            case 10:
                big.image = UIImage(named: "sunny")
                first.text = "맑음"
            case 11:
                big.image = UIImage(named: "cloudy")
                first.text = "구름"
            case 12:
                big.image = UIImage(named: "rainy")
                first.text = "비"
            case 13:
                big.image = UIImage(named: "snowy")
                first.text = "눈"
            default:
                print("something wrong")
        }
    }
    
    
    
    
    
}
