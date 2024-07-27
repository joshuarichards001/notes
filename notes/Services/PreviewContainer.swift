//
//  PreviewContainer.swift
//  notes
//
//  Created by Josh Richards on 27/07/2024.
//

import SwiftData
import SwiftUI

@MainActor
struct PreviewContainer {
  let container: ModelContainer

  init() {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let schema = Schema([NoteModel.self])
    do {
      container = try ModelContainer(for: schema, configurations: config)
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }
  
  func addNote(note: NoteModel) {
    container.mainContext.insert(note)
  }

  func addExampleNotes() {
    let notes = [
      NoteModel(text: "This is the first sample note."),
      NoteModel(text: "Here's a second note for testing."),
      NoteModel(text: "And a third one to see how multiple notes look."),
    ]
    notes.forEach { container.mainContext.insert($0) }
  }
}

@MainActor
extension View {
  func previewWithExampleNotes() -> some View {
    let container = PreviewContainer()
    container.addExampleNotes()
    return self.modelContainer(container.container)
  }
  
  func previewWithNote(note: NoteModel) -> some View {
    let container = PreviewContainer()
    container.addNote(note: note)
    return self.modelContainer(container.container)
  }
}
