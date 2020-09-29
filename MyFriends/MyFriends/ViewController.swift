//
//  ViewController.swift
//  MyFriends
//
//  Created by sangheon on 2020/09/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var friends:[Friends] = []
    let cellIdentifer:String = "cell"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifer, for: indexPath)
        
        let friend:Friends = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    
       
    @IBOutlet weak var tableView:UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder:JSONDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name:"friends") else {
           return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friends].self, from: dataAsset.data)
        } catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }


}

