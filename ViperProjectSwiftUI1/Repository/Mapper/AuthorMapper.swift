//
//  AuthorMapper.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 26/06/23.
//

import Foundation
import CoreData

extension Author {
    func toStorageEntity(_ context: NSManagedObjectContext) -> AuthorEntity {
        let a = AuthorEntity(context: context)
        a.uid = UUID()
        a.id = id
        a.name = name
        
        return a
    }
}

extension AuthorEntity {
    func toModel() -> Author {
        return Author(id: id, name: name!)
    }
}
