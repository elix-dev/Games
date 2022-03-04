//
//  StructData.swift
//  Games
//
//  Created by Elias José Rodriguez on 28/02/22.
//

/*{
 "id" : 516,
 "developer" : "KRAFTON, Inc.",
 "short_description" : "Get into the action in one of the longest running battle royale games PUBG Battlegrounds.",
 "release_date" : "2022-01-12",
 "publisher" : "KRAFTON, Inc.",
 "game_url" : "https:\/\/www.freetogame.com\/open\/pubg",
 "genre" : "Shooter",
 "platform" : "PC (Windows)",
 "freetogame_profile_url" : "https:\/\/www.freetogame.com\/pubg",
 "title" : "PUBG: BATTLEGROUNDS",
 "thumbnail" : "https:\/\/www.freetogame.com\/g\/516\/thumbnail.jpg"
}*/

import Foundation

struct GameData : Identifiable {

    let id: String
    let developer: String
    let short_description: String
    let release_date: String
    let publisher: String
    let game_url: String
    let genre: String
    let freetogame_profile_url: String
    let title: String
    let thumbnail: String
}





