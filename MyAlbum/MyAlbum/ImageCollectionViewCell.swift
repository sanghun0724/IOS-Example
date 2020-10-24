//
//  ImageCollectionViewCell.swift
//  MyAlbum
//
//  Created by sangheon on 2020/10/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView:UIImageView!
    
    func configurecell(image:UIImage){
        imageView.image = image
    }
}
