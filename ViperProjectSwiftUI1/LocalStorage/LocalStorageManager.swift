//
//  LocalStorageManager.swift
//  ViperProjectSwiftUI1
//
//  Created by Pedro Luis on 26/06/23.
//

import Foundation
import CoreData

class LocalStorageManager {
    static let shared = LocalStorageManager()
    
    private let modelName = "ViperProjectSwiftUI1Model"
    private let persistenceStoreContainer: NSPersistentContainer
    
    private init() {
        persistenceStoreContainer = NSPersistentContainer(name: modelName)
        persistenceStoreContainer.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Unable to initialize CoreData from \(self.modelName): \(error)")
            }
        }
    }
    
    static var viewContext: NSManagedObjectContext {
        get {
            return self.shared.persistenceStoreContainer.viewContext
        }
    }
}
