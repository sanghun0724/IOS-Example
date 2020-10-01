//
//  ViewController.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    var weather:[WeatherInformation] = []
    var firstCellIdentifier:String = "firstcell"
    
    
    
    func getImage(from string:String) -> UIImage? {
//출처https://stackoverflow.com/questions/54955132/how-to-get-image-from-json-in-swift
        guard let url = URL(string:string) else {
            print("imageURL에 뭔가 잘못됌")
            return nil
        }
    
    var image:UIImage? = nil
    do{
    let data = try Data(contentsOf: url,options: [])
    }catch {
    print(error.localizedDescription)
    }
        return image
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.firstCellIdentifier, for: indexPath)
        
        let weather:WeatherInformation = self.weather[indexPath.row]
        
        cell.textLabel?.text = weather.name
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


}

