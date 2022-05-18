//
//  User+CoreDataProperties.swift
//  
//
//  Created by Meghna on 18/05/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var pin: String?
    @NSManaged public var islogin: String?

}
