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
    var myCountry:[MyCountry] = []
    var firstCellIdentifier:String = "firstcell"
   
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FirstCell = tableView.dequeueReusableCell(withIdentifier: self.firstCellIdentifier, for: indexPath) as! FirstCell
        
        let myCountry:MyCountry = self.myCountry[indexPath.row]
        
        cell.Label.text = myCountry.koreanName
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
            self.myCountry = try jsonDecoder.decode([MyCountry].self, from: dataAsset.data)
        }catch {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "show", sender: self)
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondView =
                segue.destination as? SecondView else{
            return
        }
                   if let indexPath = tableView.indexPathForSelectedRow{
                       let Mycountry:MyCountry  = self.myCountry[indexPath.row]
                    nextViewController.text1 = Mycountry.koreanName
                    nextViewController.text2 = Mycountry.assetName
                   }
               
        
        
        }


         
    }
    
    
    


