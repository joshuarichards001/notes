//
//  ContentView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NotesListView()
            NoteInputView().padding()
        }
        .navigationTitle("Quick Notes")
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    @MainActor in
    NavigationView {
        ContentView().previewWithNotes()
    }
}
