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
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                    .ignoresSafeArea()
                VStack{
                    AsyncImage(url: URL(string: artistDetail.pictureMedium)).clipShape(Circle()).frame(width:260,height:260).background(.green).clipShape(Circle())
                    Text("\(artistDetail.name)").font(.title).fontWeight(.black)
                    Text("\(artistDetail.nbFan) listeners").font(.title2).fontWeight(.medium)
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
        ArtistDetailView(artistDetail: .init(id: 0, name: "Artist Name", link: "link", share: "share", picture: "pic", pictureSmall: "picS", pictureMedium: "https://e-cdns-images.dzcdn.net/images/artist/aee3e04eea97d949e423521f7f9c56cd/250x250-000000-80-0-0.jpg", pictureBig: "picB", pictureXl: "picXL", nbAlbum: 0, nbFan: 0, radio: true, tracklist: "tracklist", type: "type"))
    }
}
