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
    let customCellIdentifier: String = "customcell"
    
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
       
        if indexPath.section < 2{
            let cell:UITableViewCell =
                tableView.dequeueReusableCell(withIdentifier: self.celldentifier, for: indexPath)
            
        let text:String = indexPath.section == 0 ? Korean[indexPath.row] : English[indexPath.row]
        cell.textLabel?.text = text
            return cell
        }
        else {
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = self.dateFormetter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormetter.string(from: self.dates[indexPath.row])
            return cell
        }
        
       
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
        return section == 0 ?  "한글":"영어"
        }
        return nil
    }
    var dates:[Date] = []
    //왼쪽
    let dateFormetter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter
    }()
    //오른쪽
    let timeFormetter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation          //sender 은 네비게이션의 흐름을 만들게 된녀석 여기서는 TableView위의 셀
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: SecondViewController =
                segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell:UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        nextViewController.textToSet = cell.textLabel?.text  
    }

}


