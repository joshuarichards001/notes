//
//  NoteInputView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct NoteInputView: View {
  @Environment(\.modelContext) var context
  @State private var inputText = ""
  @FocusState private var isInputFocused: Bool

  var body: some View {
    HStack {
      TextField("Enter Note...", text: $inputText, axis: .vertical)
        .lineLimit(10)
        .focused($isInputFocused)
      Button(action: {
        if !inputText.isEmpty {
          let newNote = NoteModel(text: inputText)
          context.insert(newNote)
          inputText = ""
          isInputFocused = false
        }
      }) {
        Image(systemName: "arrow.up")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(8)
          .background(Color.indigo)
          .clipShape(RoundedRectangle(cornerRadius: 8))
      }
      .opacity(inputText.isEmpty ? 0 : 1)
      .animation(.easeInOut(duration: 0.5), value: !inputText.isEmpty)
    }
    .padding(8)
    .background(Color(UIColor.secondarySystemGroupedBackground))
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(UIColor.systemFill), lineWidth: 1)
    )
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .shadow(color: Color(UIColor.systemGroupedBackground), radius: 12)
    .padding(.init(top: 0, leading: 18, bottom: 18, trailing: 18))
    .onAppear {
      isInputFocused = true
    }
    .simultaneousGesture(
      DragGesture(minimumDistance: 10, coordinateSpace: .local)
        .onEnded { value in
          let isDragDownwards = value.translation.height > 0
          let isDragVertical = abs(value.translation.width) < abs(value.translation.height)

          if isDragDownwards && isDragVertical {
            isInputFocused = false
          }
        }
    )
  }
}

#Preview {
  @MainActor in
  return NoteInputView().previewWithNotes(addExamples: false)
}
