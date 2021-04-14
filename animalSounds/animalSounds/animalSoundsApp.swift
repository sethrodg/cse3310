//
//  animalSoundsApp.swift
//  animalSounds
//
//  Created by Seth Rodgers on 3/19/21.
//

import SwiftUI
import CoreData


@main
struct animalSoundsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "DataModel")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
    }()
}
