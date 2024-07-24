//
//  NotesListView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct NotesListView: View {
    let notes = [
        NoteModel(text: "First note"),
        NoteModel(text: "Second note"),
        NoteModel(text: "Third note")
    ]
    
    var body: some View {
        List(notes) { note in
            VStack(alignment: .leading) {
                Text(note.text)
                Text(note.timestamp.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NotesListView()
}
