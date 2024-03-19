//
//  ModelData.swift
//  NotesA
//
//  Created by Wi Fi on 14.03.2024.
//

import Foundation

struct Note: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var text: String
    var created: Date
    var lastEdited: Date
    
    static var emptyNote: Note {
        Note(title: "", text: "", created: Date(), lastEdited: Date())
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("notes")
        .appendingPathExtension("plist")
    
    static func saveToFile (notes:[Note]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedNotes = try? propertyListEncoder.encode(notes)
       
        try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Note] {
        var dNotes:[Note] = []
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNotesData = try? Data(contentsOf: archiveURL),
            let decodedNotes = try?
           propertyListDecoder.decode(Array<Note>.self,
           from: retrievedNotesData) {
           dNotes = decodedNotes
        }

        return dNotes
    }
     
  
    
    
}

extension Note {
    static var sampleNotes: [Note] =
    [
        Note(title: "Grape", text: "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis. Grapes are a non-climacteric type of fruit, generally occurring in clusters.The cultivation of grapes began perhaps 8,000 years ago, and the fruit has been used as human food over history. Eaten fresh or in dried form (as raisins, currants and sultanas), grapes also hold cultural significance in many parts of the world, particularly for their role in winemaking. Other grape-derived products include various types of jam, juice, vinegar and oil.",
             created: Date(), lastEdited: Date()),
        
        Note(title: "Mango", text: "A mango is an edible stone fruit produced by the tropical tree Mangifera indica. It originated from the region between northwestern Myanmar, Bangladesh, and northeastern India.",
             created: Date(), lastEdited: Date()),
        
        Note(title: "Orange", text: "An orange, also called sweet orange to distinguish it from the bitter orange Citrus × aurantium, is the fruit of a tree in the family Rutaceae. Botanically, this is the hybrid Citrus × sinensis,[1] between the pomelo (Citrus maxima) and the mandarin orange (Citrus reticulata).",
             created: Date(), lastEdited: Date())
 
    ]
}


