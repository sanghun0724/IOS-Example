//
//  ViewController.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/12.
//

import UIKit
import Photos

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate{
    
//    func photoLibraryDidChange(_ changeInstance: PHChange) {
//        <#code#>
//    }
    
    
    @IBOutlet var collectionView:UICollectionView!
    var fetchResult:[PHFetchResult<PHAsset>] = []
    let imageManager:PHCachingImageManager = PHCachingImageManager()
    let nextCellIdentifier:String = "photoList"
    var selecetedcellIndex:Int = 0
    var cellSize:CGSize?
    //album
    var albumNameList:[String] = []
    var albumCountList:[Int] = []
//    var albumCollectionList:[PHAssetCollection] = []
    let half:Double = Double(UIScreen.main.bounds.width / 2.0 - 10)
    override func viewWillAppear(_ animated: Bool) {
        print("dasdasdawdsd")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sssssss")
        requestPhotosPermission()
       
        UIdesine()
        collectionView.reloadData()
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
        return fetchResult.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let assetResult:PHAsset = fetchResult[indexPath.item].object(at: 0)
        
        cell.albumName.text = self.albumNameList[indexPath.item]
        cell.albumCountTitle.text = String(self.albumCountList[indexPath.item])
        OperationQueue.main.addOperation
         {
            self.imageManager.requestImage(for: assetResult, targetSize: CGSize(width: self.half, height: self.half), contentMode: .aspectFill, options: nil, resultHandler:{ assetResult, _ in cell.imageView?.image = assetResult   })
        }
       
//        OperationQueue().addOperation {
//            self.imageManager.requestImage(for: assetResult, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: nil, resultHandler: {
//                assetResult, _ in  OperationQueue.main.addOperation {
//                    cell.imageView.image = assetResult
//                    cell.albumName.text = self.albumNameList[indexPath.item]
//                    cell.albumCountTitle.text = String(self.albumCountList[indexPath.item])
             
        return cell
        }
//            })
//        }
//        return cell
//    }
    
    func requestCollection(){
        print("222")
//        self.fetchResult.removeAll()
//        self.albumNameList.removeAll()
//        self.albumCountList.removeAll()
        //self.albumCollectionList.removeAll()
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let listFetchOptions = PHFetchOptions()
        listFetchOptions.sortDescriptors = [NSSortDescriptor(key: "localizedTitle", ascending: false)]
    
        fetchResult.append(PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions))
        albumNameList.append("Camera Roll")
        albumCountList.append(fetchResult[0].count)
        
        let albumList: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: listFetchOptions)
        let albumCount = albumList.count
        let album:[PHAssetCollection] = albumList.objects(at: IndexSet(0..<albumCount))
           print("33333333")
        
        //분류
        for i in  0..<albumCount {
            fetchResult.append(PHAsset.fetchAssets(in: album[i], options: fetchOptions))
            albumCountList.append(fetchResult[i+1].count)
            albumNameList.append(album[i].localizedTitle!)
        }
        }
    
    func UIdesine() {
        let flowlayout = UICollectionViewFlowLayout()
               
               flowlayout.sectionInset = UIEdgeInsets.zero
               flowlayout.minimumLineSpacing = 30
               flowlayout.minimumInteritemSpacing = 10
        
               flowlayout.itemSize = CGSize(width: half, height: half + 50)
               
               self.collectionView.collectionViewLayout = flowlayout
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

    




