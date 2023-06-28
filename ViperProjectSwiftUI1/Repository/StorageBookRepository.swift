//
//  StorageBookRepository.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 26/06/23.
//

import Foundation

class StorageBookRepository : BookRepository {
    private let context = LocalStorageManager.viewContext
    
    func getAll() -> [Book] {
        var results: [Book] = []
        
        do {
            let fetchRequest = BookEntity.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(BookEntity.title), ascending: true)]
            let fetchResult = try context.fetch(fetchRequest)
            
            results = fetchResult.map { $0.toModel() }
        } catch {
            print("BookEntity fetchRequest: \(error)")
        }
        
        return results
    }
    
    func save(_ books: [Book]) {
        books.forEach { add($0) }
        saveChanges()
    }
    
    func save(_ book: Book) {
        add(book)
        saveChanges()
    }
    
    private func add(_ book: Book) {
        let _ = book.createStoreEntity(context)
    }
    
    private func saveChanges() {
        do {
            try context.save()
        } catch {
            print("BookEntity save: \(error)")
        }
    }
}
