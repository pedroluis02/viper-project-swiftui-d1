//
//  AuthorRepositoryTests.swift
//  ViperProjectSwiftUI1Tests
//
//  Created by Pedro Luis on 27/06/23.
//

import XCTest
import CoreData
@testable import ViperProjectSwiftUI1

final class AuthorRepositoryTests: XCTestCase {
    private var context: NSManagedObjectContext!
    private var repository: AuthorRepository!
    
    override func setUpWithError() throws {
        context = LocalStorageManager.viewContext
        repository = StorageAuthorRepository()
    }

    override func tearDownWithError() throws {
    }
    
    func testSave() throws {
        let count = try countAll()
        
        let author = Author(id: 20, name: "Erich Gamma")
        repository.save(author)
        
        try showAll()
        
        let newCount = try countAll()
        let want = (count + 1)
        XCTAssertEqual(want, newCount)
    }
    
    private func countAll() throws -> Int {
        let list = repository.getAll()
        return list.count
    }
    
    private func showAll() throws {
        let list = repository.getAll()
        let result = list.map { $0.name }
            .joined(separator: ", ")
        print(result)
    }
}
