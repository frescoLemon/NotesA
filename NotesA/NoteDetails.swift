//
//  NoteDetails.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import SwiftUI

struct NoteDetails: View {
    
    @Binding var notes: [Note]
    
    @Binding var note: Note
    @State private var title = ""

    @Environment(\.dismiss) private var dismiss

    @State private var italic = false
    @State private var bold = false
    
    var body: some View {
            VStack {
                TextField("Untitled", text: $note.title, axis: .vertical)
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding(.bottom)

                HStack {
                    Label("Created", systemImage: "clock")
                        .font(.caption)
                    Spacer()
                    Text("\(note.created.formatted(date: .numeric, time: .standard))")
                        .font(.caption)
                }
                HStack {
                    Label("Last Edited", systemImage: "clock")
                        .font(.caption)
                    Spacer()
                    Text("\(Date().formatted(date: .numeric, time: .standard))")
                        .font(.caption)
                }
                .padding(.bottom)
                TextEditor(text: $note.text)
                
                    .border(.accent)
                    .scrollContentBackground(.hidden)
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup {
                    
                    Button("Done") {
                        
                        let editedNote = Note(title: note.title, text: note.text, created: note.created, lastEdited: Date())
                        note.text = editedNote.text
                     

                        dismiss()
                        Note.saveToFile(notes: notes)
                    }
                }
            }
            .background(Gradient(colors: gradientColors))  
            .foregroundColor(.black)
            
            
        
    }
}

#Preview {
    NavigationStack {
        NoteDetails(notes: Binding.constant(Note.sampleNotes), note: Binding.constant(Note.sampleNotes[0]))
    }
}
