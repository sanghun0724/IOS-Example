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
        requestPhotosPermission()
        requestCollection()
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
        return albumNameList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
                as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        if albumNameList.isEmpty {
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
        return cell
    }
    
    func requestCollection(){
        self.fetchResult.removeAll()
        self.albumNameList.removeAll()
        self.albumCountList.removeAll()
        self.albumCollectionList.removeAll()
        
        var album:[albumModel] = [albumModel]()
        let realAlbum = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
        
        var album2:[albumModel] = [albumModel]()
        
        realAlbum.enumerateObjects {object,index,terminate in
            let obj: PHAssetCollection = object
            var assetCount = obj.estimatedAssetCount
            if assetCount == NSNotFound {
            let fetchOptions = PHFetchOptions()
                fetchOptions.predicate = NSPredicate(format:"mediaType == %d", PHAssetMediaType.image.rawValue)
                assetCount = PHAsset.fetchAssets(in: obj, options: fetchOptions).count
            }
            guard let localizedTitle = obj.localizedTitle else {
                return
            }
            let otherAlbum = albumModel(name: localizedTitle, count: assetCount, collection: obj)
            album2.append(contentsOf: album)
//            if (assetCount > 0) {
//                let otherAlbum =albumModel(name: localizedTitle, count: assetCount, collection: obj)
//                album.append(contentsOf: album2)
//            }
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            for i in album {
                self.albumNameList.append(i.name)
                self.albumCountList.append(i.count)
                self.albumCollectionList.append(i.collection)
            }
            
            for i in 0..<album.count {
                if album.isEmpty == false {
                    self.fetchResult.append(PHAsset.fetchAssets(in: realAlbum.object(at: i), options: fetchOptions))
                }
            }
        }
    }
    
    func fetchSmartCollection(with:PHAssetCollectionType,subtypes:[PHAssetCollectionSubtype]) ->[PHCollection]{
        var collections:[PHAssetCollection] = []
        let options = PHFetchOptions()
        options.includeHiddenAssets = false
        
        for subtype in subtypes {
            if let collection = PHAssetCollection.fetchAssetCollections(with: with, subtype: subtype, options: options).firstObject{
                collections.append(collection)
            }
        }
        return collections
    }
    
   


    

    

}


