//
//  ArtistDetailView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import SwiftUI

struct ArtistDetailView: View {
    
    @StateObject private var adVM = ArtistDetailViewModel()
    let artistDetail: ArtistDetail
    var body: some View {
        NavigationStack{
            ZStack{
                //UI Background
                LinearGradient(gradient: Gradient(stops:[Gradient.Stop(color: Color(red:87/255,green:108/255,blue:188/255), location: 0.02),Gradient.Stop(color:  Color(red:11/255,green:36/255,blue:71/255), location: 0.30)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack{
                    AsyncImage(url: URL(string: artistDetail.picture)).clipShape(Circle()).frame(width:1250,height:125).background(Color(red:15/255,green:52/255,blue:96/255)).clipShape(Circle())
                    Text("\(artistDetail.name)").font(.title).fontWeight(.medium).foregroundColor(Color(red:165/255,green:215/255,blue:232/255))
                   
                    ScrollView{
                        AlbumDetailView(albumDetail: .init(id: artistDetail.id , title: "", link: "", cover: "", coverSmall: "", coverMedium: "", coverBig: "", coverXl: "", md5Image: "", genreID: 0, fans: 0, releaseDate: "", recordType: "", tracklist: "", explicitLyrics: false, type: ""))
                        
                    }
                    
                }.listStyle(.plain).navigationBarTitle("", displayMode: .inline)
                    .onAppear(perform: adVM.fetchArtistDetails)
                    .toolbarBackground(Color(red: 0.1, green: 0.2, blue: 0.45), for: .navigationBar)
               
                    
            }
        }
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artistDetail: .init(id: 117, name: "Artist Name", link: "link", share: "share", picture: "https://api.deezer.com/artist/8283402/image", pictureSmall:"https://e-cdns-images.dzcdn.net/images/artist/aee3e04eea97d949e423521f7f9c56cd/56x56-000000-80-0-0.jpg", pictureMedium: "https://e-cdns-images.dzcdn.net/images/artist/aee3e04eea97d949e423521f7f9c56cd/250x250-000000-80-0-0.jpg", pictureBig: "picB", pictureXl: "picXL", nbAlbum: 0, nbFan: 0, radio: true, tracklist: "tracklist", type: "type"))
    }
}
