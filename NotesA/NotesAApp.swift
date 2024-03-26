//
//  NotesAApp.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import SwiftUI

@main
struct NotesAApp: App {
    @State private var notes: [Note] = []
    
    var body: some Scene {
        WindowGroup {
            NotesList(note: Note.sampleNotes[0], notes: $notes)
                .onAppear(){
                    notes = Note.loadFromFile()
                    print(Note.documentsDirectory)
                }
                .onDisappear{
                    Note.saveToFile(notes: notes)
                }
        }
    }
}
