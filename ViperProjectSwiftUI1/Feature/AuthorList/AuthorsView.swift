//
//  AuthorsView.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 27/06/23.
//

import Foundation
import CoreData
import SwiftUI

struct AuthorsView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var fecthedAuthors: FetchedResults<AuthorEntity>
    
    var body: some View {
        List {
            let authors = fecthedAuthors.map { $0.toModel()}
            ForEach (authors, id: \.id) { author in
                Text(author.name).bold().lineLimit(2)
            }
        }
        .navigationBarTitle("Authors", displayMode: .inline)
    }
}

struct AuthorsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView()
    }
}
