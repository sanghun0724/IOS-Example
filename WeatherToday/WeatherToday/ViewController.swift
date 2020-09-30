//
//  ViewController.swift
//  WeatherToday
//
//  Created by sangheon on 2020/09/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func getImage(from string:String) -> UIImage? {
        //https://stackoverflow.com/questions/54955132/how-to-get-image-from-json-in-swift
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

