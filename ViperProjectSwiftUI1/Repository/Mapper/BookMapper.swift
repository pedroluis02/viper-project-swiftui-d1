//
//  BookMapper.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 26/06/23.
//

import Foundation
import CoreData

extension Book {
    func createStoreEntity(_ context: NSManagedObjectContext) -> BookEntity {
        let b = BookEntity(context: context)
        b.uid = UUID()
        b.id = id
        b.title = title
        b.desc = description
        
        let authorsSet = Set<AuthorEntity>(authors.map { $0.createStorageEntity(context) })
        authorsSet.forEach { b.addToAuthors($0) }
        
        return b
    }
}

extension BookEntity {
    func toModel() -> Book {
        var authorsList: [Author] = []
        if (authors != nil) {
            let authorsSet = authors?.allObjects as! [AuthorEntity]
            authorsList = authorsSet.map{ $0.toModel() }
        }
        
        return Book(id: id, title: title!, authors: authorsList, description: desc!)
    }
}
