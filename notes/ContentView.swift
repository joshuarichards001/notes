//
//  ContentView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [
        NoteModel(text: "First note"),
        NoteModel(text: "Second note"),
        NoteModel(text: "Third note")
    ]
    
    func addNote(note: NoteModel) {
        notes.append(note)
    }
    
    func deleteNote(_ note: NoteModel) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
    }
    
    var body: some View {
        VStack {
            NotesListView(notes: $notes)
            NoteInputView(addNote: addNote).padding()
        }
        .navigationTitle("Quick Notes")
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
