//
//  ViewController.swift
//  FriendsCollection
//
//  Created by sangheon on 2020/10/12.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    var friend: [Friends] = []
    let cellIdentifier:String = "cell"
    @IBOutlet weak var collectionView:UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:FriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendsCollectionViewCell
        
        let friend:Friends = self.friend[indexPath.item]
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.addressLabel.text = friend.fullAddress
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.reloadData()  //indexpath.row == indexpath.item
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout:UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        flowLayout.minimumInteritemSpacing = 10 //아이템간의
        flowLayout.minimumLineSpacing = 10 //그 세로 줄간의
        
        let halfwidth: CGFloat = UIScreen.main.bounds.width / 2.0
          
        flowLayout.estimatedItemSize = CGSize(width: halfwidth - 30, height: 90)
          //절반보다는 작게 가로 //예상 사이즈 
      
        
        let jsonDecoder:JSONDecoder = JSONDecoder()
        guard let dataAsset:NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do {
            self.friend = try jsonDecoder.decode([Friends].self,from:dataAsset.data)
        } catch {
            print("dasd")
        }
        // Do any additional setup after loading the view.
    }


}

