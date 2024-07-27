//
//  ContentView.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack(alignment: .bottom) {
      NotesListView()
      NoteInputView()
        .padding(.init(top: 8, leading: 18, bottom: 18, trailing: 18))
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
