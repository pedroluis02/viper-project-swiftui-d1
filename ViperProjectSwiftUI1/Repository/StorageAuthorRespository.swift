//
//  StorageAuthorRespository.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 27/06/23.
//

import Foundation

class StorageAuthorRepository : AuthorRepository {
    private let context = LocalStorageManager.viewContext
    
    func getAll() -> [Author] {
        var results: [Author] = []
        do {
            let fetchRequest = AuthorEntity.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(AuthorEntity.name), ascending: true)]
            let fetchResult = try context.fetch(fetchRequest)
            
            results = fetchResult.map { $0.toModel() }
        } catch {
            print("AuthorEntity fetchRequest: \(error)")
        }
        
        return results
    }
    
    func save(_ authors: [Author]) {
        authors.forEach { add($0) }
        saveChanges()
    }
    
    func save(_ author: Author) {
        add(author)
        saveChanges()
    }
    
    private func add(_ author: Author) {
        let _ = author.createStorageEntity(context)
    }
    
    private func saveChanges() {
        do {
            try context.save()
        } catch {
            print("AuthorEntity save: \(error)")
        }
    }
}
