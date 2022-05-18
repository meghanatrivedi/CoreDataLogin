//
//  DatabaseHelper.swift
//  CoreDataLogin
//
//  Created by Meghna on 17/05/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var shareInstance = DatabaseHelper()
    var cotext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: cotext!) as! User
        user.email = object["email"]
        user.name = object["name"]
        user.pin = object["pin"]
        user.islogin = object["true"]
        do {
            try cotext?.save()
        }catch{
            print("Data is not saved!")
        }
        
    }
    
    func getUserData() -> [User]{
        var user = [User]()
        let featchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do{
            user = try cotext?.fetch(featchRequest) as! [User]
        }catch{
            print("can not get data")
        }
        return user
    }
    
    
    func deleteData(index:Int) -> [User]{
        var user = [User]()
        cotext?.delete(user[index])
        user.remove(at: index)
        do{
            try cotext?.save()
        }catch{
            print("can not delete data")
        }
        return user
    }
    
    
    
    
    func saveImagesCoreData(ar imgData:Data){
        let profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: cotext!) as! Profile
        profile.imgData = imgData
        do{
            try cotext?.save()
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    func getAllImages() -> [Profile]{
        var arrProfile = [Profile]()
        let featchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do{
            arrProfile = try cotext?.fetch(featchRequest) as! [Profile]
        }catch let error{
            print(error.localizedDescription)
        }
        return arrProfile
    }
}
