//
//  AuthorRepository.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 27/06/23.
//

import Foundation

protocol AuthorRepository {
    func getAll() -> [Author]
    func save(_ authors: Author)
    func save(_ author: [Author])
}
