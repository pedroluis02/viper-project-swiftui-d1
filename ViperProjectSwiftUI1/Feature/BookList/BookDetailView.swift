//
//  BookDetailView.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 21/06/23.
//

import SwiftUI

struct BookDetailView: View {
    var book: BookViewModel
    
    var body: some View {
        VStack {
            Text(book.title).font(.title).bold().padding()
            Text(book.authors)
            Text(book.description).padding()
            Spacer()
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let book = BookViewModel(id: 1, title: "Book 1", authors: "Author 1, Author 2", description: "Description 1")
        BookDetailView(book: book)
    }
}
