//
//  CollectionViewDatasource.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/30.
//

import UIKit
import Photos
class CollectionViewDatasource:NSObject,UICollectionViewDataSource,UICollectionViewDelegate{
    var fetchResult:[PHFetchResult<PHAsset>] = []
    let imageManager:PHCachingImageManager = PHCachingImageManager()
    var albumNameList:[String] = []
    var albumCountList:[Int] = []
    
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
            self.imageManager.requestImage(for: assetResult, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: nil, resultHandler:{ assetResult, _ in cell.imageView?.image = assetResult   })
        }
        return cell
    }
    func requestCollection(){
        //        self.fetchResult.removeAll()
        //        self.albumNameList.removeAll()
        //        self.albumCountList.removeAll()
        //self.albumCollectionList.removeAll()
        let assetCollection: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let albumCollection = assetCollection.firstObject else {
            return
        }
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let listFetchOptions = PHFetchOptions()
        listFetchOptions.sortDescriptors = [NSSortDescriptor(key: "localizedTitle", ascending: false)]
        let albumList: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: listFetchOptions)
        let albumCount = albumList.count
        let album:[PHAssetCollection] = albumList.objects(at: IndexSet(0..<albumCount))
        
        fetchResult.append(PHAsset.fetchAssets(in: albumCollection, options: fetchOptions))
        albumNameList.append("Camera Roll")
        albumCountList.append(fetchResult[0].count)
        for i in  0..<albumCount {
            fetchResult.append(PHAsset.fetchAssets(in: album[i], options: fetchOptions))
            albumCountList.append(fetchResult[i+1].count)
            albumNameList.append(album[i].localizedTitle!)
        }
    }
}

