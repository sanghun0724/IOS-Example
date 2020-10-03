//
//  ViewController.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let flagImageElement = ["flag_kr","flag_de","flag_it","flag_us","flag_fr","flag_jp"]
    @IBOutlet weak var tableView:UITableView!
    var weather:[WeatherInformation] = []
    var firstCellIdentifier:String = "firstcell"
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FirstCell = tableView.dequeueReusableCell(withIdentifier: self.firstCellIdentifier, for: indexPath) as! FirstCell
        
        let weather:WeatherInformation = self.weather[indexPath.row]
        
        cell.Label?.text = weather.koreanName
        cell.countryImage.image = UIImage(named: flagImageElement[indexPath.row])
        
        return cell
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder:JSONDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name:"countries") else {
            return
        }
        do{
            self.weather = try jsonDecoder.decode(([WeatherInformation].self), from: dataAsset.data)
        }catch {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondView =
                segue.destination as? SecondView else{
            return
        }
        guard let cell:UITableViewCell = sender as? UITableViewCell else {
            return
        }
        if cell.textLabel?.text == "한국"  {
            nextViewController.cloud = cell.self
        }
        
        
        }
   
   
         
    }
    
    
    


