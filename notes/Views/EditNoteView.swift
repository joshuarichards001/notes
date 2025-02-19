//
//  EditNoteView.swift
//  notes
//
//  Created by Josh Richards on 27/07/2024.
//

import SwiftData
import SwiftUI

struct EditNoteView: View {
  @Bindable var note: NoteModel
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      Form {
        TextField("Enter Note", text: $note.text, axis: .vertical)
          .lineLimit(5...10)
      }
      .navigationTitle("Edit Note")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            dismiss()
          }
        }
        ToolbarItem(placement: .confirmationAction) {
          Button("Save") {
            dismiss()
          }
        }
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
    return EditNoteView(note: note)
      .modelContainer(container)
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
