//
//  Note.swift
//  Final
//
//  Created by Mac User on 12/12/22.
//

import CoreData

@objc(Note)
class Note: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date!
    @NSManaged var username: String!
    @NSManaged var password: String!
    @NSManaged var notes: String!
}
