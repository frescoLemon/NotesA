//
//  NotesAApp.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import SwiftUI

@main
struct NotesAApp: App {
    var body: some Scene {
        WindowGroup {
            NotesList(note: Note.sampleNotes[0], notes: Note.sampleNotes)
        }
    }
}
