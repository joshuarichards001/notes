//
//  notesApp.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftData
import SwiftUI

@main
struct NotesApp: App {
  @State private var modelContainer: ModelContainer?
  @State private var errorMessage: String?
  
  private func setupModelContainer() {
    do {
      let schema = Schema([NoteModel.self])
      let container = try ModelContainer(for: schema, configurations: [])
      self.modelContainer = container
    } catch {
      self.errorMessage = "Failed to set up the model container: \(error.localizedDescription)"
    }
  }
  
  var body: some Scene {
    WindowGroup {
      Group {
        if let container = modelContainer {
          NavigationView {
            ContentView()
          }
          .modelContainer(container)
        } else if let error = errorMessage {
          ErrorView(message: error)
        }
      }
      .onAppear(perform: setupModelContainer)
    }
  }
}
