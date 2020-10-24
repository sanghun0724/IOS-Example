//
//  ViewController.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/12.
//

import UIKit
import Photos

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,,UINavigationControllerDelegate{
    
    @IBOutlet var collectionView:UICollectionView!
    var fetchResult:[PHFetchResult<PHAsset>] = []
    let imageManager:PHCachingImageManager = PHCachingImageManager()
    let nextCellIdentifier:String = "photoList"
    var selecetedcellIndex:Int = 0
    var cellSize:CGSize?
    //album
    var albumNameList:[String] = []
    var albumCountList:[Int] = []
    var albumCollectionList:[PHAssetCollection] = []
    
    //class for an album
    class albumModel{
    let name:String
    let count:Int
    let collection:PHAssetCollection
    init(name:String,count:Int,collection:PHAssetCollection) {
        self.name = name
        self.count = count
        self.collection = collection
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func requestPhotosPermission() {
        let photoAuthorizationStatusStatus = PHPhotoLibrary.authorizationStatus()

        switch photoAuthorizationStatusStatus {
        case .authorized:
            print("승인되었습니다")
            self.requestCollection()
        case .denied:
            print("거절되었습니다")
        case .notDetermined:
            print("결정되지않았습니다")
            PHPhotoLibrary.requestAuthorization(){
                (status) in
                switch status {
                case .authorized:
                    print("승인되었습니다")
                    self.requestCollection()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumNameList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
                as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        let assetResult:PHAsset = fetchResult[indexPath.item].object(at: 0)
        OperationQueue().addOperation {
            self.imageManager.requestImage(for: assetResult, targetSize: CGSize(width: 140, height: 140), contentMode: .aspectFill, options: nil, resultHandler: {
                image, _ in  OperationQueue.main.addOperation {
                    cell.imageView.image = image
                }
            })
        }
    }
    
    func requestCollection(){
        self.fetchResult.removeAll()
        self.albumNameList.removeAll()
        self.albumCountList.removeAll()
        
    }
    
    
    
   


    

    

}

