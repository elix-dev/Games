//
//  get service.swift
//  Games
//
//  Created by Elias Jose Rodriguez Indaburo on 2/03/22.
//

//import Foundation
import SwiftUI
//import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON
//import Kingfisher
    
let endpointPlatform = "/games?platform=browser"
let endpointCategory = "/games?category=shooter"
let urlBase = "https://www.freetogame.com/api"
let urlEveryone = "https://www.freetogame.com/api/games"
var endpoint = endpointPlatform

func validation(value: Bool) {
    if value {
        endpoint = endpointPlatform
    } else {
        endpoint = endpointCategory
    }
}

class Observer: ObservableObject {
    
    @Published var games = [GameData]()
    @State private var endpointChange = endpoint
    init() {
                //\(urlEveryone)\(endpointChange)
        AF.request("\(urlEveryone)").responseData { (dataGames) in
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

