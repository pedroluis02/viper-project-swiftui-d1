//
//  ViperProjectSwiftUI1App.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 20/06/23.
//

import SwiftUI

@main
struct ViperProjectSwiftUI1App: App {
    private let viewContext = LocalStorageManager.viewContext
    
    init() {
        LocalStorageManager.fillSampleDataOnce()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
