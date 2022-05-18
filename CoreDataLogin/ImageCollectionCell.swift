//
//  ImageCollectionCell.swift
//  mconnectmedia
//
//  Created by Meghna on 17/05/22.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    var parentVC : UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prePareCell()
        // Initialization code
    }
    @IBAction func btnSelectAction(_ sender: UIButton) {
        
//        let multipleimage = self.images[sender.tag]
//       
//        
//        if btnSelect.currentImage!.isEqual(#imageLiteral(resourceName: "ic_uncheck")){
//            btnSelect.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
//            multipleimagesArray.append(multipleimage)
//            print(multipleimagesArray)
//        }else{
//            cell.btnSelect.setImage(#imageLiteral(resourceName: "ic_uncheck"), for: .normal)
//            multipleimagesArray.remove(at: indexPath.item)
//            print(multipleimagesArray)
//        }
//        btnSelect.setImage(#imageLiteral(resourceName: "ic_check"), for: .normal)
//        if let parentVC = parentVC as? HomeVC {
//       //     parentVC.dataDelete(cellValue: sender.tag)
//        }
    }
}
extension ImageCollectionCell{
    func prePareCell(){
        backView.backgroundColor = .clear
        btnSelect.setImage(#imageLiteral(resourceName: "ic_uncheck"), for: .normal)
        btnSelect.tintColor = .blue
    }
}
