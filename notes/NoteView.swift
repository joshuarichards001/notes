//
//  NoteView.swift
//  notes
//
//  Created by Josh Richards on 27/07/2024.
//

import SwiftData
import SwiftUI

struct NoteView: View {
  @Bindable var note: NoteModel
  @Environment(\.modelContext) var context

  func deleteNote(_ note: NoteModel) {
    context.delete(note)
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text(note.text)
      Text(note.createdTimestamp.formatted(date: .abbreviated, time: .shortened))
        .font(.caption)
        .foregroundColor(.gray)
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
      Button(role: .destructive) {
        deleteNote(note)
      } label: {
        Label("Delete", systemImage: "trash")
      }
    }
    .contextMenu {
      Button(
        role: .destructive,
        action: {
          deleteNote(note)
        }
      ) {
        Label("Delete", systemImage: "trash")
      }
    }
  }
}

#Preview {
  @MainActor in
  let note = NoteModel(text: "This is a preview note for NoteView.")
  return NoteView(note: note).previewWithNotes(addExamples: false)
}
