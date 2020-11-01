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
    let nextCellIdentifier:String = "photoList"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionViewDatasource
        collectionView.delegate = collectionViewDatasource
        requestPhotosPermission()
        UIDesine()
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
    
    func UIDesine() {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == nextCellIdentifier {
            guard let cell:CollectionViewCell = sender as? CollectionViewCell else {
                return
            }
            guard let indexValue:IndexPath = self.collectionView.indexPath(for: cell) else {
                return
            }
            guard let nextViewController:PhotoList = segue.destination as? PhotoList else {
                return
            }
            nextViewController.mainTitle = collectionViewDatasource.albumNameList[indexValue.item]
            nextViewController.albumThing = collectionViewDatasource.fetchResult[indexValue.item]
            nextViewController.indexThing = indexValue.item
        }
    }
}






