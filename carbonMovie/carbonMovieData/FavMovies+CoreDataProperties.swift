//
//  FavMovies+CoreDataProperties.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/28/21.
//
//

import Foundation
import CoreData


extension FavMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavMovies> {
        return NSFetchRequest<FavMovies>(entityName: "FavMovies")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var image: String?

}

extension FavMovies : Identifiable {

}
