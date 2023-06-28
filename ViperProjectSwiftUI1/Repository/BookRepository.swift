//
//  BookRepository.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 21/06/23.
//

import Foundation

protocol BookRepository {
    func getAll() -> [Book]
    func save(_ books: [Book])
    func save(_ book: Book)
}
