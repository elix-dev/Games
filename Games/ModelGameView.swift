//
//  SwiftUIView.swift
//  Games
//
//  Created by Elias Jose Rodriguez Indaburo on 1/03/22.
//

import SwiftUI

struct GameView: View {
    var thumbnail = ""
    var title = ""
    var short_description = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        HStack {
            VStack {
                
                /*AsyncImage(url: URL(string: game.thumbnail))
                     .frame(width: 0.5, height: 0.5)
                
                Text(title).font(.title2)
                     Text(short_description).font(.footnote)*/
            }
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


