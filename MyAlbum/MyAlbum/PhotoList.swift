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
    var mainTitle:String?
    var indexThing:Int!
    var albumThing:PHFetchResult<PHAsset>!
   
    let photoListCellIdentifier:String = "photoListCell"
    let cachingManager:PHCachingImageManager = PHCachingImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
    

}
