//
//  Notes.swift
//  WBChatAppSUI
//
//  Created by Daria on 23.07.2024.
//

import SwiftUI

class NotesManager {
    static let shared = NotesManager()
    
    private init() { }
    
    @Published var notes: [String] = []
    
    func addNote(_ note: String) {
        notes.append(note)
    }
}

class NotesViewModel: ObservableObject {
    @Published var notes: [String] = []
    
    init () {
        self.notes = NotesManager.shared.notes
    }
    
    func addNote(_ note: String) {
        NotesManager.shared.addNote(note)
        self.notes = NotesManager.shared.notes
    }
}

struct Notes: View {
    @ObservedObject var viewModel: NotesViewModel
    
    @State private var newNote: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter note", text: $newNote)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    viewModel.addNote(newNote)
                    newNote = ""
                } label: {
                    Text("Add note")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                List(viewModel.notes, id: \.self) { note in
                    Text(note)
                }
                .listStyle(.plain)
                .padding()
            }
        }
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        Notes(viewModel: NotesViewModel())
    }
}
