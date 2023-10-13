//
//  Favourite+CoreDataProperties.swift
//  
//
//  Created by Hoang Linh Nguyen on 12/10/2023.
//
//

import Foundation
import CoreData

extension Favourite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourite> {
        return NSFetchRequest<Favourite>(entityName: "Favourite")
    }

    @NSManaged public var id: Int64
    @NSManaged public var playerName: String?
    @NSManaged public var clubLogo: String?
    @NSManaged public var clubName: String?
    @NSManaged public var playerImage: String?

}
