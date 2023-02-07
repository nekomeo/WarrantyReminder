//
//  WarrantyReminderApp.swift
//  WarrantyReminder
//
//  Created by Elle Tee on 2023-02-07.
//

import SwiftUI

@main
struct WarrantyReminderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
