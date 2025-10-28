//
//  swift_cicdApp.swift
//  swift_cicd
//
//  Created by Trung Nguyen on 27/10/25.
//

import SwiftUI
import CoreData

@main
struct swift_cicdApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        print("GlobalSettings \(GlobalSettings.env) \(GlobalSettings.apiKey) secretKey \(GlobalSettings.secretKey)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
