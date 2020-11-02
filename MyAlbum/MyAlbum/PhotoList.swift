//
//  PhotoDetail.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/30.
//

import UIKit
import Photos
class PhotoList: UIViewController,UICollectionViewDataSource {
    
    @IBOutlet var photoCollectionView:UICollectionView!
    @IBOutlet var listedButton:UIBarButtonItem!
    var mainTitle:String!
    var indexThing:Int!
    var albumThing:PHFetchResult<PHAsset>!
    var alignment:Bool = true
   
    let photoListCellIdentifier:String = "photoListCell"
    let cachingManager:PHCachingImageManager = PHCachingImageManager()
    var photoAssetCollection:PHAssetCollection?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesine()
        navigationItem.title = mainTitle
        
    }
    @IBAction func changeList(_ sender: Any){
        listed()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumThing.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:PhotoListCell = collectionView.dequeueReusableCell(withReuseIdentifier: photoListCellIdentifier, for: indexPath) as? PhotoListCell else {
            return UICollectionViewCell()
        }
        
        let photo:PHAsset = albumThing.object(at: indexPath.item)
        
        cachingManager.requestImage(for: photo, targetSize:CGSize(width: 128, height: 128), contentMode:.aspectFill , options: nil, resultHandler: {
            photo, _ in cell.ImageList.image = photo
        })
       return cell
    }
    
    func UIDesine() {
        let collectionViewLayout:UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 128 , height: 128 )
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets.zero
            layout.scrollDirection = .vertical
            return layout
        }()
        photoCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    func listed() {
        let listedOption:PHFetchOptions = PHFetchOptions()
        
        if alignment {
            listedButton.title = "과거순"
            alignment = false
            listedOption.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: false)]
        }
        else {
            listedButton.title = "최신순"
            alignment = true
            listedOption.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: true)]
        }
        guard let photoAssetCollection = photoAssetCollection else {
            return
        }
        self.albumThing = PHAsset.fetchAssets(in: photoAssetCollection, options: listedOption)
        photoCollectionView.reloadData()
    }
}
