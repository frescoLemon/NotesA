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
@Binding var notes: [Note]
    
var body: some View {

            NavigationStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 17)
                    .fill(Gradient(colors: gradientColors))
                    .ignoresSafeArea()

                List {
                    ForEach($notes, id: \.self) { $note in
                     
                                             NavigationLink(destination: NoteDetails(notes: $notes, note: $note)) {
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
                   
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        NavigationLink(destination: NewNote(notes: $notes)){
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                    
                   
                }
                

            }
                
            
    
                 
    }
          
       
    }
        
}

#Preview {
    NotesList(note: Note.sampleNotes[0], notes: Binding.constant(Note.sampleNotes))
}
