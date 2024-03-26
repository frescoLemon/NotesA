//
//  NoteView.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import SwiftUI

struct NoteView: View {
  
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(note.title)
                Spacer()
                Text("\(note.created.formatted(date: .numeric, time: .omitted))")
                                    .font(.body)
            }
        Spacer()
        HStack {
            Label("Note", systemImage: "note.text")
                .labelStyle(.iconOnly)
            Text(note.text.prefix(20))
                .font(.body)
                .fontWeight(.regular)
                  }
    }
        .padding()
        .foregroundColor(.black)
    }
}

#Preview {
    NoteView(note: Note.sampleNotes[0])
        .background(Gradient(colors: gradientColors))          .previewLayout(.fixed(width: 400, height: 60))
}
