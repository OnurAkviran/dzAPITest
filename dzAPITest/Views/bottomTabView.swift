//
//  bottomTabView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 13.05.2023.
//

import SwiftUI

struct bottomTabView: View {
    var body: some View {
        
        TabView{
            ContentView().tabItem{
                Image(systemName: "music.note")
                
                
            }.toolbar(.visible, for: .tabBar).toolbarBackground(.regularMaterial, for: .tabBar)
            LikedSongsView().tabItem{
                Image(systemName: "heart.fill")
                
            }.toolbar(.visible, for: .tabBar).toolbarBackground(.regularMaterial, for: .tabBar)
        }
    }
}

struct bottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        bottomTabView()
    }
}
