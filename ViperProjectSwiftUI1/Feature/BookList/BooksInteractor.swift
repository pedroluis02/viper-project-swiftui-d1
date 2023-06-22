//
//  BooksInteractor.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 20/06/23.
//

import Combine

class BooksInterector {
    private let repository: BookRepository
    @Published var books: [Book] = []
    
    init (repository: BookRepository) {
        self.repository = repository
        
        load()
    }
    
    private func load() {
        books = repository.getAll()
    }
}
