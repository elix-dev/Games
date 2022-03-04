

/*import SwiftUI
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON
import Kingfisher



func validation(value: Bool) {
    if value {
        endpoint = endpointPlatform
    } else {
        endpoint = endpointCategory
    }
}

struct GetGames: View {
    
    @ObservedObject var obs = Observer()
    
    class   Observer: ObservableObject {
        @Published var games = [GameData]()
        @State private var endpointChange = endpoint
        init() {
            
            AF.request("\(urlBase)\(endpointChange)").responseData { (dataGames) in
                let json = try! JSON(data: dataGames.data!)
                for game in json {
                    print(game.1)
                    self.games.append(
                        GameData(
                            id: game.1["id"].stringValue,
                            developer: game.1["developer"].stringValue,
                            short_description: game.1["short_description"].stringValue,
                            release_date: game.1["release_date"].stringValue,
                            publisher: game.1["publisher"].stringValue,
                            game_url: game.1["game_url"].stringValue,
                            genre: game.1["genre"].stringValue,
                            freetogame_profile_url: game.1["freetogame_profile_url"].stringValue,
                            title: game.1["title"].stringValue,
                            thumbnail: game.1["thumbnail"].stringValue))
                    
                }
                print(self.games.count)
            }
        }
    }
    
      
    
    @State private var searchText: String = ""//Barra de busqueda
    @State private var filterGamesType = true
    
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

struct GetGames_Previews: PreviewProvider {
    static var previews: some View {
        GetGames()
    }
}


/////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\///////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



//
//  GetGames.swift
//  Games
//
//  Created by Elias José Rodriguez on 28/02/22.
//

/*import SwiftUI
 import SDWebImageSwiftUI
 import Alamofire
 import SwiftyJSON
 import Kingfisher
 
 struct GetGames: View {
 
 @ObservedObject var obs = observer()
 @State private var searchText: String = ""
 var searchResults: GameData
 
 
 //@State private var show = true
 //@State var endpoint: String
 //let endpointPlatform = "/games?platform=all"
 //let endpointCategory = "/games?category=shooter"
 
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
 
 NavigationLink(destination: Detail(id: game.thumbnail, developer: game.developer,
 short_description: game.short_description,
 release_date: game.release_date,
 publisher: game.publisher,
 game_url: game.game_url,
 genre: game.genre,
 freetogame_profile_url: game.freetogame_profile_url,
 title: game.title,
 thumbnail: game.thumbnail)) {
 
 HStack{
 VStack{
 AsyncImage(url: URL(string: game.thumbnail))
 .aspectRatio(contentMode: .fill)
 .frame(width:190, height:190)
 .scaledToFill()
 .clipShape(RoundedRectangle(cornerRadius: 5))
 .shadow(radius:30)
 
 }
 VStack(alignment: .leading, spacing: 8, content:{
 Text(game.title)
 .font(.title2)
 Text(game.short_description)
 .font(.footnote)
 
 })
 
 }
 
 }
 
 }.navigationTitle("Games" )
 .searchable(text: $searchText,
 placement: .navigationBarDrawer(displayMode: .always), prompt: "Serch for Game"
 
 }
 
 //List(dataGames) {
 
 }
 
 
 class observer: ObservableObject {
 @Published var games = [GameData]()
 
 let urlBase = "https://www.freetogame.com/api"
 init() {
 AF.request("\(urlBase)").responseData { (dataGames) in
 let json = try! JSON(data: dataGames.data!)
 for game in json {
 print(game.1)
 self.games.append(GameData(id: game.1["id"].stringValue,
 developer: game.1["developer"].stringValue,
 short_description: game.1["short_description"].stringValue,
 release_date: game.1["release_date"].stringValue,
 publisher: game.1["publisher"].stringValue,
 game_url: game.1["game_url"].stringValue,
 genre: game.1["genre"].stringValue,
 freetogame_profile_url: game.1["freetogame_profile_url"].stringValue,
 title: game.1["title"].stringValue,
 thumbnail: game.1["thumbnail"].stringValue))
 
 }
 print(self.games.count)
 }
 }
 }
 
 struct GetGames_Previews: PreviewProvider {
 static var previews: some View {
 GetGames(searchResults: <#GameData#>)
 }
 }*/
 **/
