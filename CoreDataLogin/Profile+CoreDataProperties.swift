//
//  Profile+CoreDataProperties.swift
//  
//
//  Created by Meghna on 17/05/22.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var imgData: Data?

}
