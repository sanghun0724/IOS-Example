//
//  ViewController.swift
//  Networking
//
//  Created by sangheon on 2020/11/09.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    let cellIentifier:String = "friendcell"
    var friends:[Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url: URL = URL(string: "") else {
            return
        }
        
        let session:URLSession = URLSession(configuration: .default)
        let dataTask:URLSessionTask = session.dataTask(with: url) {
            (data:Data?,respons: URLResponse?,error:Error?) in
            
            if let eerror = error {
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do{
                let apiResponse:APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIentifier, for: indexPath)
       
        let friend:Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil //나중에 이미지 가져오기전에 다른이미지표현이 안되고 있는 상태로 비워줘야함
        
        DispatchQueue.global().async {
            guard let imageURL:URL = URL(string: friend.picture.thumnail) else {
                return
            }
            guard let imgaeData: Data = try? Data(contentsOf: imageURL) else {
                return
            }
            DispatchQueue.main.async {
                //테이블뷰 인덱스 맞춰주기
                if let index:IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.imageView?.image = UIImage(data: imgaeData)
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                    }
                }
            }//이미지 잘안뜰시 플레이스홀더나 그런걸로 나오기전 이미지 설정해주는 것도좋음
        }
        
        return cell
    }
    

}

