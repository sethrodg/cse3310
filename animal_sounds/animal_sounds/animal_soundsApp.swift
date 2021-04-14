//
//  animal_soundsApp.swift
//  animal_sounds
//
//  Created by Seth Rodgers on 4/13/21.
//

import SwiftUI

@main
struct animal_soundsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
