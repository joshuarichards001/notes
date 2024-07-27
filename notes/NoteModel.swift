//
//  NoteModel.swift
//  notes
//
//  Created by Josh Richards on 24/07/2024.
//

import Foundation
import SwiftData

@Model
class NoteModel: Identifiable {
  var text: String
  let timestamp: Date

  init(text: String) {
    self.text = text
    self.timestamp = Date()
  }
}
