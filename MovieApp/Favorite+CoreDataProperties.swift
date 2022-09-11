//
//  Favorite+CoreDataProperties.swift
//  
//
//  Created by Fikrat on 16.08.22.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var favorites: String?
    @NSManaged public var favoriteImage: String?

}

extension Favorite : Identifiable {

}
