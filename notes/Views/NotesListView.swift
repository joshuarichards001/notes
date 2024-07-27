//
//  NotesListView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftData
import SwiftUI

struct NotesListView: View {
  @Query(sort: \NoteModel.createdTimestamp) var notes: [NoteModel] = []
  @State private var selectedNote: NoteModel?

  var body: some View {
    List {
      ForEach(notes) { note in
        NoteView(note: note)
          .onTapGesture {
            selectedNote = note
          }
      }
    }
    .overlay {
      if notes.isEmpty {
        ContentUnavailableView(
          label: {
            Label("No Notes", systemImage: "note.text")
          },
          description: {
            Text("Add a note to get started.")
          })
      }
    }
    .sheet(item: $selectedNote) { note in
      EditNoteView(note: note)
    }
  }
}

#Preview {
  @MainActor in
  NotesListView().previewWithExampleNotes()
}
