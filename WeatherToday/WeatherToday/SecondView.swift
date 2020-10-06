
//  SecondView.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/30.
//

import UIKit
class SecondView: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var checkValue:String?
    var countryName:String?{
        if checkValue == "한국" {
            return "kr"
        };   return "kr"
    }
    var stateValue:Int?
    let secondCellIDentifier: String = "secondcell"
    var weather2:[WeatherInformation] = []
    let snow:String = "snowy"
    let sun:String = "sunny"
    let rain:String = "rainy"
    let cloud:String = "cloudy"
    @IBOutlet weak var tableView:UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weather2.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SecondCell = tableView.dequeueReusableCell(withIdentifier: self.secondCellIDentifier, for: indexPath) as! SecondCell
        let weather2:WeatherInformation = self.weather2[indexPath.row]
        
        cell.label1.text = weather2.city_name
        
        
        
//        let state = self.stateValue
//        switch state {
//        case 10:
//            cell.SecondImage.image = UIImage(named: sun)
//        case 11:
//            cell.SecondImage.image = UIImage(named: cloud)
//        case 12:
//            cell.SecondImage.image = UIImage(named: rain)
//        case 13:
//            cell.SecondImage.image = UIImage(named: snow)
//        default:
//            print("something wrong")
//        }
        return cell
        
    }
    override func viewDidLoad() {
        print(checkValue)
        print(countryName)
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        guard let dataAsset:NSDataAsset = NSDataAsset(name: countryName ?? "freak") else {
            return
        }
        do {
            self.weather2 = try jsonDecoder.decode([WeatherInformation].self,from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        tableView.reloadData()
    }


}
