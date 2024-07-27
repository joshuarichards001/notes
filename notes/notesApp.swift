//
//  notesApp.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftData
import SwiftUI

@main
struct notesApp: App {
  let container: ModelContainer = {
    let schema = Schema([NoteModel.self])
    let container = try! ModelContainer(for: schema, configurations: [])
    return container
  }()

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
    .modelContainer(container)
  }
}
