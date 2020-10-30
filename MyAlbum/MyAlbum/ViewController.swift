//
//  ViewController.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/12.
//

import UIKit
import Photos

class ViewController: UIViewController,UINavigationControllerDelegate{
    

    let collectionViewDatasource = CollectionViewDatasource()
    @IBOutlet var collectionView:UICollectionView!

//    let nextCellIdentifier:String = "photoList"
//    var selecetedcellIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sssssss")
        collectionView.dataSource = collectionViewDatasource
        collectionView.delegate = collectionViewDatasource
        requestPhotosPermission()
        UIdesine()
        collectionView.reloadData()
    }
    
    private func requestPhotosPermission() {
        let photoAuthorizationStatusStatus = PHPhotoLibrary.authorizationStatus()

        switch photoAuthorizationStatusStatus {
        case .authorized:
            print("승인되었습니다")
            self.collectionViewDatasource.requestCollection()
        case .denied:
            print("거절되었습니다")
        case .notDetermined:
            print("결정되지않았습니다")
            PHPhotoLibrary.requestAuthorization(){
                (status) in
                switch status {
                case .authorized:
                    print("승인되었습니다")
                    self.collectionViewDatasource.requestCollection()
                case .denied:
                    print("거절되었습니다")
                    break
                default:
                    break
                }
            }
        case .restricted:
            print("제한되었습니다")
        default:
            break
        }
    }
   
    
    
    func UIdesine() {
       
        
        let collectionViewLayout:UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 200 , height: 260 )
            layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets.zero
            layout.scrollDirection = .vertical
            return layout
        }()
        collectionView.collectionViewLayout = collectionViewLayout
        
               
               
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let nextViewController:
//
//        guard let cell:ImageCollectionViewCell = sender as? ImageCollectionViewCell else {
//             return
//        }
//        guard let indexValue:IndexPath = self.collectionView.indexPath(for: cell) else {
//             return
//        }
//
//    }
}

    




