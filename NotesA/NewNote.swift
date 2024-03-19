//
//  NoteDetailView.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import SwiftUI

struct NewNote: View {
  
    @Binding var notes: [Note]

    @State var newNote = Note.emptyNote
    @State private var fontSize = 12.0

    @Environment(\.dismiss) private var dismiss

  
    
    @State private var italic = false
    @State private var bold = false
    
    var body: some View {
            VStack {
                TextField("Untitled", text: $newNote.title, axis: .vertical)
                                    .font(.title)
                                    .foregroundStyle(.black)
                                    .padding(.bottom)
                HStack {
                    Label("Created", systemImage: "clock")
                        .font(.caption)
                    Spacer()
                    Text("\(newNote.created.formatted(date: .numeric, time: .standard))")
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
                TextEditor(text: $newNote.text)
                    .border(.accent)
                    .scrollContentBackground(.hidden)


                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup {
                    
                    Button("Done") {
                        let new = Note(title: newNote.title, text: newNote.text, created: Date(), lastEdited: Date())
                        notes.append(new)

                        dismiss()
                        Note.saveToFile(notes: notes)
                    }
                }
            }
            .background(Gradient(colors: gradientColors))            .foregroundColor(.black)
            
            
        
    }
}

#Preview {
    NavigationStack {
        NewNote(notes: Binding.constant(Note.sampleNotes))
    }
}
