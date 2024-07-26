//
//  NoteInputView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct NoteInputView: View {
    @State private var inputText = ""
    @FocusState private var isInputFocused: Bool
    var addNote: (NoteModel) -> Void
    
    var body: some View {
        HStack {
            TextField("Enter Note", text: $inputText, axis: .vertical)
                .lineLimit(10)
                .focused($isInputFocused)
            Button(action: {
                if !inputText.isEmpty {
                    let newNote = NoteModel(text: inputText)
                    addNote(newNote)
                    inputText = ""
                }
            }) {
                Image(systemName: "arrow.up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(8)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding(8)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onAppear {
            isInputFocused = true
        }
    }
}

#Preview {
    NoteInputView(addNote: { note in
        print("Note Added")
    })
}
