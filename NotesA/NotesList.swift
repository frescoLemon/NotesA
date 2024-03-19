//
//  ContentView.swift
//  AppleNotes
//
//  Created by Wi Fi on 13.03.2024.
//

import SwiftUI



let gradientColors: [Color] = [.gradientTop, .gradientBottom]

struct NotesList: View {
    
@State var note: Note
@State var notes: [Note]
@State private var isEditing = false

@State private var isAddingNewNote = false
    
   
    
   
var body: some View {

            NavigationStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                    .fill(Gradient(colors: gradientColors))
                    .ignoresSafeArea()

                List {
                    ForEach($notes, id: \.self) { $note in
                     
                        NavigationLink(destination: NoteDetails(notes: .constant(Note.sampleNotes), note: $note)) {
                            NoteView(note: note)
                                
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                notes.removeAll { $0.id == note.id }
                                Note.saveToFile(notes: notes)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                                       }
                    .listRowBackground(RoundedRectangle(cornerRadius: 15)
                        .background(.clear)
                                          .foregroundStyle(.clear)
                      )


                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(isEditing ? "Done" : "Edit") {
                            isEditing.toggle()
                        }
                    }
                   
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        NavigationLink(destination: NewNote(notes: $notes)){
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                    
                   
                }
                

            }               
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

#Preview {
    NotesList(note: Note.sampleNotes[0], notes: Note.sampleNotes)
}
