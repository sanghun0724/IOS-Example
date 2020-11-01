//
//  PhotoListCollection.swift
//  MyAlbum
//
//  Created by sangheon on 2020/11/01.
//

import UIKit
import Photos
class PhotoListCollection:NSObject,UICollectionViewDataSource {
    
    var photoListValue = PhotoList()
    let photoListCellIdentifier:String = "photoListCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoListValue.albumThing?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:PhotoListCell = collectionView.dequeueReusableCell(withReuseIdentifier: photoListCellIdentifier, for: indexPath) as? PhotoListCell else{
            return UICollectionViewCell
        }
    }
    

    
 
}
