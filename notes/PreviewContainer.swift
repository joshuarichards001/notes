//
//  PreviewContainer.swift
//  notes
//
//  Created by Josh Richards on 27/07/2024.
//

import SwiftUI
import SwiftData

@MainActor
struct PreviewContainer {
    let container: ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: NoteModel.self, configurations: config)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func addExampleNotes() {
        let notes = [
            NoteModel(text: "This is the first sample note."),
            NoteModel(text: "Here's a second note for testing."),
            NoteModel(text: "And a third one to see how multiple notes look.")
        ]
        notes.forEach { container.mainContext.insert($0) }
    }
}

@MainActor
extension View {
    func previewWithNotes(addExamples: Bool = true) -> some View {
        let container = PreviewContainer()
        if addExamples {
            container.addExampleNotes()
        }
        return self
            .modelContainer(container.container)
    }
}
