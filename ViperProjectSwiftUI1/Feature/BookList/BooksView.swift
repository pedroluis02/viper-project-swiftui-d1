//
//  BooksView.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 21/06/23.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject var presenter: BooksPresenter
    
    var body: some View {
        List {
            ForEach (presenter.books, id: \.id) { book in
                NavigationLink(destination: presenter.detailView(book)) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(book.title).bold().lineLimit(1)
                        Text(book.authors).font(.caption).lineLimit(1).padding(.top, 2)
                    }
                }
            }
        }
        .navigationBarTitle("Books", displayMode: .inline)
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = BooksInterector(repository: SampleBookRepository())
        let presenter = BooksPresenter(interactor: interactor)
        
        BooksView(presenter: presenter)
    }
}
