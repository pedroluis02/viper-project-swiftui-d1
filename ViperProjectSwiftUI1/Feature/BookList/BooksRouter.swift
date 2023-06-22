//
//  BooksRouter.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 21/06/23.
//

import SwiftUI

struct BooksRouter {
    func listView() -> some View {
        let interactor = BooksInterector(repository: SampleBookRepository())
        let presenter = BooksPresenter(interactor: interactor)
        return BooksView(presenter: presenter)
    }
    
    func detailView(_ book: BookViewModel) -> some View {
        BookDetailView(book: book)
    }
}
