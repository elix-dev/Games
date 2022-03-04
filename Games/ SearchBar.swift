//
//   SearchBar.swift
//  Games
//
//  Created by Elias Jose Rodriguez Indaburo on 3/03/22.
//

import SwiftUI

private var searchResults:  [GameData] {
    @ObservedObject var obs = observer()
    return obs.games()
}


struct _SearchBar: View {
    var body: some View {
        NavigationView {
            
        }
        
        
        
    }
}








struct _SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        _SearchBar()
    }
}
