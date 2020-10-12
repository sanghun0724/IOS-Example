//
//  ViewController.swift
//  FriendsCollection
//
//  Created by sangheon on 2020/10/12.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource{
    
    var numberofCell:Int = 10
    let cellIdentifier:String = "cell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberofCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

