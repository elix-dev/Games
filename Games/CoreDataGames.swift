//
//  CoreDataGames.swift
//  Games
//
//  Created by Elias Jose Rodriguez Indaburo on 16/03/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description,error) in
            if let error = error {
                ptint("error loading core data. \(error)")
            }
            
        }
    }
}

struct CoreDataGames: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoreDataGames_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataGames()
    }
}
