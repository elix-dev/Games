//
//  Detail.swift
//  Games
//
//  Created by Elias Jose Rodriguez Indaburo on 1/03/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON

struct Detail: View {
    
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
    //var heart: bool
    
    var body: some View {
        
     
        NavigationLink(destination: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
            NavigationView {
               
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "heart.fill")
                        }
                        AsyncImage(url: URL(string: thumbnail))
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius:5))
                            .shadow(radius: 30)

                        
                       // }.navigationTitle("Details Game")
                        List{
                            Text("\(title)")
                            .font(.title)
                            Text("\(short_description)")
                            Text("\(developer)")
                            Text("\(release_date)")
                            Text("\(publisher)")
                            Text("\(game_url)")
                            Text("\( genre)")
                            Text("\(freetogame_profile_url)"
                            )
                        }
                }
                }
        }

     .navigationTitle("\(title)")
     .navigationBarTitleDisplayMode(.inline)
     .ignoresSafeArea(edges: .all)
    }


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(id: "text", developer:"text", short_description: "text",  release_date: "text",
               publisher: "text",
               game_url: "text",
               genre: "text",
               freetogame_profile_url: "text",
               title: "text", thumbnail: "text"
        )
            .preferredColorScheme(.dark)
    }
}

}
