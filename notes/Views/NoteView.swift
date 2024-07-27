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

  func deleteNote(note: NoteModel) {
    context.delete(note)
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text(note.text)
      Text(note.createdTimestamp.formatted(date: .abbreviated, time: .omitted))
        .font(.caption)
        .foregroundColor(.gray)
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
      Button(role: .destructive) {
        deleteNote(note: note)
      } label: {
        Label("Delete", systemImage: "trash")
      }
    }
    .contextMenu {
      Button(
        role: .destructive,
        action: {
          deleteNote(note: note)
        }
      ) {
        Label("Delete", systemImage: "trash")
      }
    }
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: NoteModel.self, configurations: config)
    let note = NoteModel(text: "This is a preview note for NoteView.")
    let context = container.mainContext
    context.insert(note)
    return NoteView(note: note)
      .modelContainer(container)
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
