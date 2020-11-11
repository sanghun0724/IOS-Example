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
     //노티피케이션 스트링값이나 키값들 상수로 정리 잘해두고 //특징으로는 코드가 잘분산되므로 간단한 경우에는 안쓰는 경우가 많지만 한번에 여러가지 인스턴스를 처리할때에는 요긴함!
    override func viewDidAppear(_ animated: Bool) {
        requestFriends()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //노티피케이션센터를 통해서 "나 이제 들을거야!" 리시브
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecieveFriendsNotification(_:)), name: DidRecieveFriendsNotification, object: nil)
    }
    
    @objc func didRecieveFriendsNotification(_ noti: Notification) {
        guard let friends:[Friend] = noti.userInfo?["friends"] as? [Friend] else {
            return
        }
        self.friends = friends
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
            }//이미지 잘안뜰시 플레이스홀더나 그런걸로 나오기전 이미지 설정해주는 것도좋음//인디케이터?
        }
        
        return cell
    }
    
   

}

