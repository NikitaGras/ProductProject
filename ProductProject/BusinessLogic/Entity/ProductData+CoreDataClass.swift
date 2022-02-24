//
//  ProductData+CoreDataClass.swift
//  ProductProject
//
//  Created by Nikita Gras on 14.01.2021.
//
//

import Foundation
import CoreData

@objc(ProductData)
public class ProductData: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "ProductData")
    }

    @NSManaged public var name: String?
    @NSManaged public var count: Double
}
