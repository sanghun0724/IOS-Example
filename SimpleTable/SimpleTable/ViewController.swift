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
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Korean.count
        case 1:
            return English.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell =
            tableView.dequeueReusableCell(withIdentifier: self.celldentifier, for: indexPath)
        if indexPath.section < 2{
        let text:String = indexPath.section == 0 ? Korean[indexPath.row] : English[indexPath.row]
        cell.textLabel?.text = text
        }
        else {
            cell.textLabel?.text = self.dateFormetter.string(from: self.dates[indexPath.row])
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
        return section == 0 ?  "한글":"영어"
        }
        return nil
    }
    var dates:[Date] = []
    
    let dateFormetter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender : UIButton){
        dates.append(Date())
       // self.tableView.reloadData() //그섹션만 데이터 가져오는게 아니라 전체데이터를 다시불러오게 됨
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self  // 스토리보드에서 위에 프로토콜 채택한것들 ViewController에 연결한거를 코드로 나타낸것
    }


}


