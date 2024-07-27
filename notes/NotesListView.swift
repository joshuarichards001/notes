//
//  NotesListView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI
import SwiftData

struct NotesListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \NoteModel.timestamp) var notes: [NoteModel] = []
    
    func deleteNote(_ note: NoteModel) {
        context.delete(note)
    }
    
    var body: some View {
        List {
            ForEach(notes) { note in
                VStack(alignment: .leading) {
                    Text(note.text)
                    Text(note.timestamp.formatted(date: .abbreviated, time: .shortened))
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
                    Button(role: .destructive, action: {
                        deleteNote(note)
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
        .overlay {
            if notes.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Notes", systemImage: "note.text")
                }, description: {
                    Text("Add a note to get started.")
                })
            }
        }
    }
}

#Preview {
    return NotesListView()
}
