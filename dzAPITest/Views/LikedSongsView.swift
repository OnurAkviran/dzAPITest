//
//  LikedSongs.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 13.05.2023.
//

import SwiftUI

struct LikedSongsView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(stops:[Gradient.Stop(color: Color(red:87/255,green:108/255,blue:188/255), location: 0.02),Gradient.Stop(color:  Color(red:11/255,green:36/255,blue:71/255), location: 0.30)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack{
                Text("Liked Songs").font(.title).fontWeight(.medium).foregroundColor(Color(red:165/255,green:215/255,blue:232/255))
               
                    TracklistView(tracklistDetail: .init(id: 304564827, readable: false, title: "", titleShort: "", titleVersion: "", isrc: "", link: "", duration: 0, trackPosition: 0, diskNumber: 0, rank: 0, explicitLyrics: false, explicitContentLyrics: 0, explicitContentCover: 0, preview: ""), albumCover: "https://e-cdns-images.dzcdn.net/images/cover/ffd88577ab6fdc7e9d81b8b6e576f0e9/56x56-000000-80-0-0.jpg")
                
            }
            
        }
    }
}

struct LikedSongsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedSongsView()
    }
}
