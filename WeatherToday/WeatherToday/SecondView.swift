
//  SecondView.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/30.
//

import UIKit
class SecondView: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var text1:String?
    var text2:String?
    
    let secondCellIDentifier: String = "secondcell"
    var weather2:[WeatherInformation] = []
    @IBOutlet weak var tableView:UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weather2.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SecondCell = tableView.dequeueReusableCell(withIdentifier: self.secondCellIDentifier, for: indexPath) as! SecondCell
        let weather2:WeatherInformation = self.weather2[indexPath.row]
        let Answer: Double = floor((weather2.celsius * 1.8 + 32) * 100) / 100
        cell.label1.text = weather2.cityName
        cell.label2.text = "섭씨 \(weather2.celsius)도 / 화씨 \(Answer)도"
        cell.label3.text = "강수확률 \(weather2.rainfallProbability)%"
        
        
    switch weather2.state{
        case 10:
            cell.SecondImage.image = UIImage(named: "sunny")
        case 11:
            cell.SecondImage.image = UIImage(named: "cloudy")
        case 12:
            cell.SecondImage.image = UIImage(named: "rainy")
        case 13:
            cell.SecondImage.image = UIImage(named: "snowy")
        default:
            print("ImageError")
        }
        return cell
        
    }
    override func viewDidLoad() {
        self.navigationItem.title = text1
        
        let jsonDecoder:JSONDecoder = JSONDecoder()
        
        guard let dataAsset:NSDataAsset = NSDataAsset(name: text2!) else {
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
