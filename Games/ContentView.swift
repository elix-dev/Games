//
//  ContentView.swift
//  Games
//
//  Created by Elias José Rodriguez on 28/02/22.
//

import SwiftUI


struct ContentView : View {
    
    //indicator
    @State private var isLoading = false
    @ObservedObject var obs = Observer()
    @State private var searchText: String = ""//Barra de busqueda
    @State private var filterGamesTypeCategory: Bool = false
    @State private var filterGamesTypePlatform: Bool = false
    @State private var showSheet: Bool = false
    private var searchResults: [GameData]{//Barra de busqueda
        let results = obs.games;
        if searchText.isEmpty {
            return  results;
        }
        else{
            
            if(filterGamesTypeCategory){
                
                return results.filter {
                    $0.genre.lowercased().contains(searchText.lowercased())
                }
                
            }
            else if(filterGamesTypePlatform) {
            
                return results.filter {
                    $0.publisher.lowercased().contains(searchText.lowercased()) // CREAR CAMPO PLATAFORMA
                }
            }
            else {
                
                return results.filter {
                    $0.title.lowercased().contains(searchText.lowercased()) // CREAR CAMPO PLATAFORMA
                }
                
            }
        }
    }
    
    var body: some View {
        //indicator
        NavigationView {
            ZStack {
                VStack {
                    List(searchResults) { game in
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
                                    VStack(alignment: .leading){
                                        AsyncImage(url: URL(string: game.thumbnail))
                                            .frame(width: UIScreen.main.bounds.width * 0.85, height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                            .shadow(radius:10)
                                            .scaledToFill()
                                        Text(game.title)
                                            .font(.title2)
                                            .multilineTextAlignment(.leading)
                                        Text(game.short_description)
                                            .font(.footnote)
                                    }
                                }
                        
                    }.navigationTitle("Games")
                        .listStyle(.grouped)
                        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for games")
                        .navigationBarBackButtonHidden(true)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {showSheet.toggle()})
                                {Image(systemName: "line.horizontal.3.decrease.circle")
                                        .padding(.horizontal)
                                }.sheet(isPresented: $showSheet) {
                                    VStack {
                                        RoundedRectangle(cornerRadius: .infinity)
                                            .foregroundColor(Color.gray)
                                            .frame(width: 40, height: 5, alignment: .top)
                                            .padding(.top, 10)
                                        Spacer()
                                            .frame(height: 30)
                                        Text("Hola! Selecciona una opción:")
                                            .padding(.bottom, 20)
                                        HStack(){
                                            Text("Platform")
                                            Toggle("", isOn: $filterGamesTypePlatform).padding(20)
                                                .onChange(of: filterGamesTypePlatform) { value in
                                                    validation(value: filterGamesTypePlatform)
                                                    if filterGamesTypePlatform {
                                                        filterGamesTypeCategory = false
                                                    }
                                                }.frame(width: 100,
                                                        height: 20,
                                                        alignment: .center)
                                        }.padding()
                                        HStack {
                                            Text("Category")
                                            Toggle("", isOn: $filterGamesTypeCategory).padding(20)
                                                .onChange(of: filterGamesTypeCategory) { value in
                                                    validation(value: filterGamesTypeCategory)
                                                    if filterGamesTypeCategory {
                                                        filterGamesTypePlatform = false
                                                    }
                                                }.frame(width: 100,
                                                        height: 20,
                                                        alignment: .center)
                                        }
                                        Spacer()
                                    }
                                }
                                
                            }
                        }
                }//indicator
                if isLoading {
                    LoadingView()
                }
            }
            
            //indicator
        }.onAppear { startFakeNetworkCall() }
    }
    //indicator
    func startFakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

//indicator
struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

