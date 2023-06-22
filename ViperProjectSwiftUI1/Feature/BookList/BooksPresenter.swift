//
//  BooksPresenter.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 21/06/23.
//

import SwiftUI
import Combine

class BooksPresenter : ObservableObject {
    private let interactor: BooksInterector
    private var cancellables = Set<AnyCancellable>()
    
    private let router = BooksRouter()
    @Published var books: [BookViewModel] = []
    
    init(interactor: BooksInterector) {
        self.interactor = interactor
        
        interactor.$books
            .map({ books -> [BookViewModel] in
                return books.map { self.mapToViewModel($0) }
            })
            .assign(to: \.books, on: self)
            .store(in: &cancellables)
    }
    
    func detailView(_ book: BookViewModel) -> some View {
        router.detailView(book)
    }
    
    private func mapToViewModel(_ b: Book) -> BookViewModel {
        BookViewModel(id: b.id, title: b.title, authors: joinAuthors(b.authors), description: b.description)
    }
    
    private func joinAuthors(_ list: [Author]) -> String {
        return list.map { $0.name }
            .joined(separator: ", ")
    }
}
