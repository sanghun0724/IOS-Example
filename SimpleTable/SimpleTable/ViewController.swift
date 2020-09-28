//
//  ViewController.swift
//  SimpleTable
//
//  Created by sangheon on 2020/09/28.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
    
    @IBOutlet weak var tableView:UITableView!
    let celldentifier: String = "cell"
    
    let Korean:[String] = ["가","나","다","라","마","바","사","아","자","차","카","파","타","하"]
    let English:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","W","X","Y","Z"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Korean.count
        case 1:
            return English.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.celldentifier, for: indexPath)
        
        let text:String = indexPath.section == 0 ? Korean[indexPath.row] : English[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ?  "한글":"영어"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self  // 스토리보드에서 위에 프로토콜 채택한것들 ViewController에 연결한거를 코드로 나타낸것
    }


}


