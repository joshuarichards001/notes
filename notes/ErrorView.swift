//
//  ErrorView.swift
//  notes
//
//  Created by Josh Richards on 28/07/2024.
//

import SwiftUI

struct ErrorView: View {
  let message: String
  
  var body: some View {
    VStack {
      Image(systemName: "exclamationmark.triangle")
        .font(.largeTitle)
        .foregroundColor(.red)
      Text("An error occurred")
        .font(.title)
        .padding()
      Text(message)
        .multilineTextAlignment(.center)
        .padding()
    }
  }
}

#Preview {
  ErrorView(message: "This is an example error message")
}
