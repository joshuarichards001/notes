//
//  NotesListView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct NotesListView: View {
    @Binding var notes: Array<NoteModel>
    
    func deleteNote(_ note: NoteModel) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
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
    }
}

#Preview {
    @State var previewNotes = [
        NoteModel(text: "Sample note 1"),
        NoteModel(text: "Sample note 2"),
        NoteModel(text: "Sample note 3")
    ]
    
    return NotesListView(notes: $previewNotes)
}
