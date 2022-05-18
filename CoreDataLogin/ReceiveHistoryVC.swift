//
//  ReceiveHistoryVC.swift
//  mconnectmedia
//
//  Created by Meghna on 17/05/22.
//

import UIKit
import Photos

class ReceiveHistoryVC: UIViewController {
    @IBOutlet weak var headerBackView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    
    var receiveAlbumImage: [PHAsset] = []
    var receiveDate: [String] = []
    var receiveTime: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prePareUI()
    }
    
    
}
extension ReceiveHistoryVC{
    func prePareUI(){
        headerBackView.backgroundColor = .clear
        lblHeader.text = "Receive History"
        lblHeader.textColor = .black
        lblHeader.font = lblHeader.font.withSize(24)
        
        btnBack.tintColor = .black
        
        tblView.tableFooterView = UIView()
        tblView.delegate = self
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
    }
}
extension ReceiveHistoryVC{
    @IBAction func btnBackAction(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
extension ReceiveHistoryVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveAlbumImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        
        let asset = self.receiveAlbumImage[indexPath.row]
        let manege = PHImageManager.default()
        manege.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil){image, _ in
            DispatchQueue.main.async {
                cell.imgView.image = image
                
            }
        }
       // cell.imgView.image = receiveAlbumImage[indexPath.row]
        cell.lblDate.text = receiveDate [indexPath.row]
        cell.lblTime.text = receiveTime[indexPath.row]
                return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
