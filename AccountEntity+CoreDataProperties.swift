//
//  AccountEntity+CoreDataProperties.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//
//

import Foundation
import CoreData


extension AccountEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEntity> {
        return NSFetchRequest<AccountEntity>(entityName: "AccountEntity")
    }

    @NSManaged public var actid: Int32
    @NSManaged public var actName: String?
    @NSManaged public var nickname: String?

}

extension AccountEntity : Identifiable {

}
