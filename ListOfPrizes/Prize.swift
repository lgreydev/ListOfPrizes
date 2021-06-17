//
//  Prize.swift
//  ListOfPrizes
//
//  Created by Sergey Lukaschuk on 17.06.2021.
//

import CoreData


@objc(Prize)
class Prize: NSManagedObject {
    
    @NSManaged var id: NSNumber!
    @NSManaged var title: NSString!
    @NSManaged var price: NSString!
    @NSManaged var totalSum: NSString!
    @NSManaged var deletedDate: Date?
    
}
