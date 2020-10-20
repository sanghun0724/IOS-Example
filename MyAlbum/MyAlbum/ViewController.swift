//
//  ViewController.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/12.
//

import UIKit
import Photos

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,PHPhotoLibraryChangeObserver{
    
    @IBOutlet var collectionView:UICollectionView!
    var fetchResult:PHFetchResult<PHAsset>
    let imageManager:PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier:String = " "
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        <#code#>
    }
    
    
    func requestCollection() {
        let cameraRoll:PHFetchResult<PHAssetCollection> =
            PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRoolCollection = cameraRoll.firstObject else {
            return
        }
        let fetchOption = PHFetchOptions()
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creatuonDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRoolCollection, options: fetchOption)
    }
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

