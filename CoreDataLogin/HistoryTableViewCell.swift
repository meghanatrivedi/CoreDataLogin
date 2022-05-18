//
//  HistoryTableViewCell.swift
//  mconnectmedia
//
//  Created by Meghna on 17/05/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        prePareCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HistoryTableViewCell{
    func prePareCell(){
        backView.backgroundColor = .clear
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 1
        
        lblDate.textColor = .black
        lblDate.font = lblDate.font.withSize(24)
        
        lblTime.textColor = .black
        lblTime.font = lblTime.font.withSize(24)
    }
}
