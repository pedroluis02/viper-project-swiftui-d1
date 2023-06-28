//
//  ContentView.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    private let router = BooksRouter()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "swift")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("VIPER Architecture Pattern").bold()
                Text("(Sample with CoreData)").font(.caption)
                NavigationLink("Books", destination: router.listView())
                    .padding()
                NavigationLink("Authors", destination: AuthorsView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
