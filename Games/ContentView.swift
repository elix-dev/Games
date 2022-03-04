//
//  ContentView.swift
//  Games
//
//  Created by Elias José Rodriguez on 28/02/22.
//

import SwiftUI

struct ContentView : View {
    
    @ObservedObject var obs = Observer()
    
    @State private var searchText: String = ""//Barra de busqueda
    @State private var filterGamesType = false
    
    /* private var searchResults: [GameData] {//Barra de busqueda
     
     let results =
     if searchText.isEmpty { return results }
     return results.filter {
     $0.title.lowercased().contains(searchText.lowercased()) || $0.id.contains(searchText)
     }
     
     }*/
    
    var body: some View {
        VStack {
            HStack{
                Text("Platform")
                Toggle("", isOn: $filterGamesType).padding(20)
                    .onChange(of: filterGamesType) { value in
                        validation(value: filterGamesType)
                    }.frame(width: 100,
                            height: 20,
                            alignment: .center
                    )
                Text("Category")
            }
        }
        NavigationView{
            List(obs.games) { game in
                NavigationLink(
                    destination: Detail(
                        id: game.thumbnail,
                        developer: game.developer,
                        short_description: game.short_description,
                        release_date: game.release_date,
                        publisher: game.publisher,
                        game_url: game.game_url,
                        genre: game.genre,
                        freetogame_profile_url: game.freetogame_profile_url,
                        title: game.title,
                        thumbnail: game.thumbnail)) {
                            
                            VStack {
                                VStack(alignment: .leading){
                                    AsyncImage(url: URL(string: game.thumbnail))
                                        .scaledToFill()
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .shadow(radius:30)
                                    Text(game.title)
                                        .font(.title2)
                                        .multilineTextAlignment(.leading)
                                    Text(game.short_description)
                                        .font(.footnote)
                                }
                            }
                        }
            }.navigationTitle("Games" )
            
            //Barra de busqueda
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for games")
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

