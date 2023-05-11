//
//  ContentView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 9.05.2023.
//

import SwiftUI
extension Array{
    func chunked(into size: Int) -> [[Element]]{
        return stride(from: 0, to:count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
        
    }
}
struct ContentView: View {
    
    
    var body: some View {
        
        GenreView(genre: .init(id: 0, name: "name", picture: "pic", type: "type", pictureSmall: "picS", pictureMedium: "picM", pictureBig: "picB", pictureXl: "picXL"))
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
