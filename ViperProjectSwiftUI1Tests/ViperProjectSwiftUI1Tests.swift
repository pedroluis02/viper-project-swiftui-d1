//
//  ViperProjectSwiftUI1Tests.swift
//  ViperProjectSwiftUI1Tests
//
//  Created by Pedro Luis on 20/06/23.
//

import XCTest
@testable import ViperProjectSwiftUI1

final class ViperProjectSwiftUI1Tests: XCTestCase {
    private var repository: BookRepository!
    private var interactor: BooksInterector!
    private var presenter: BooksPresenter!
    
    override func setUpWithError() throws {
        repository = SampleBookRepository()
        interactor = BooksInterector(repository: repository)
        presenter = BooksPresenter(interactor: interactor)
    }

    override func tearDownWithError() throws {
    }

    func testInteractor() throws {
        XCTAssertFalse(interactor.books.isEmpty)
    }

    func testMapEntityToViewModel() {
        presenter.books.enumerated().forEach { index, item in
            let countAuthors = interactor.books[index].authors.count
            if (countAuthors > 1) {
                let countSeperator = item.authors.filter({$0 == ","}).count
                XCTAssertEqual(countSeperator, countAuthors - 1)
            }
        }
    }

    func testLoadingPerformance() throws {
        self.measure {
            let list = repository.getAll()
            print(list)
        }
    }

}
