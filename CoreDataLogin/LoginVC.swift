//
//  LoginVC.swift
//  mconnectmedia
//
//  Created by Meghna on 17/05/22.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var headerBackView: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPin: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegistation: UIButton!
    
    
    var registationEmailID = ""
    var registationPin = ""
    
    var user = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prePareUI()
        
        if UserDefaults.standard.string(forKey: "emailid") != nil {
            registationEmailID = (UserDefaults.standard.value(forKey: "emailid")!) as! String
            print(registationEmailID)
        }
        
        if UserDefaults.standard.string(forKey: "pin") != nil {
            registationPin = (UserDefaults.standard.value(forKey: "pin")!) as! String
            print(registationPin)
        }
    }
}
extension LoginVC{
    func prePareUI(){
        headerBackView.backgroundColor = .clear
        lblHeader.text = "Login"
        lblHeader.textColor = .black
        lblHeader.font = lblHeader.font.withSize(24)
        
        
        lblEmail.text = "Email"
        lblEmail.textColor = .black
        lblEmail.font = lblHeader.font.withSize(20)
        
        
        lblPin.text = "Pin"
        lblPin.textColor = .black
        lblPin.font = lblHeader.font.withSize(20)
        
        
        btnLogin.backgroundColor = .clear
        btnLogin.layer.cornerRadius = 20
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor.black.cgColor
        btnLogin.setTitleColor(.black, for: .normal)
        btnLogin.setTitle("Login", for: .normal)
        
        
        btnRegistation.setTitle("Click here for registation", for: .normal)
        btnRegistation.setTitleColor(.blue, for: .normal)
        btnRegistation.backgroundColor = .clear
        
        user = DatabaseHelper.shareInstance.getUserData()
    }
}
extension LoginVC{
    @IBAction func btnLoginAction(_ sender: UIButton) {
        let keyexists = user.count
        print(keyexists)
        
        for i in 0..<(keyexists) {
            print(i)
            let val = user[i].email?.contains(txtEmail.text!)
            print(val)
            if val == false{
                showToast(message: "user id not found!")
            }else {
                if !(txtEmail.text?.isEmail())!{
                    self.showToast(message: "Please Enter Valid Email!")
                }else if(txtEmail.text == "" && txtPin.text == ""){
                    self.showToast(message: "Please Enter Data!")
                }else{
                    self.showToast(message: "Login Successfully!")
                    let story = UIStoryboard(name: "Main", bundle:nil)
                    let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    UIApplication.shared.windows.first?.rootViewController = vc
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                }
            }
        }
        
        //        if !(txtEmail.text?.isEmail())!{
        //            self.showToast(message: "Please Enter Valid Email!")
        //        }else if(txtEmail.text == "" && txtPin.text == ""){
        //            self.showToast(message: "Please Enter Data!")
        //        }else if ((registationEmailID == txtEmail.text) && (registationPin == txtPin.text)){
        //            self.showToast(message: "Login Successfully!")
        //            let story = UIStoryboard(name: "Main", bundle:nil)
        //            let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        //            UIApplication.shared.windows.first?.rootViewController = vc
        //            UIApplication.shared.windows.first?.makeKeyAndVisible()
        ////            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        ////             let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        ////             self.navigationController?.pushViewController(vc, animated: true)
        //        }else{
        //            self.showToast(message: "Please Enter Valid Data!")
        //        }
    }
    @IBAction func btnRegistaionAction(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "RegistationVC") as! RegistationVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //         let vc = storyBoard.instantiateViewController(withIdentifier: "RegistationVC") as! RegistationVC
        //         self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
