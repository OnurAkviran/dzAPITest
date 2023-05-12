//
//  AlbumDetailView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import SwiftUI

struct AlbumDetailView: View {
    @StateObject private var abdVM = AlbumDetailViewModel()
    let albumDetail: AlbumDetail
    var body: some View {
        NavigationStack{
           
            
                ScrollView{
                    ForEach(abdVM.albumDetails, id: \.id){ album in
                        LazyVStack{
                            
                               
                            NavigationLink(destination: TracklistView(tracklistDetail: .init(id: album.id, readable: true, title: album.title, titleShort: "", titleVersion: "", isrc: "", link: "", duration: 0, trackPosition: 0, diskNumber: 0, rank: 0, explicitLyrics: true, explicitContentLyrics: 0, explicitContentCover: 0, preview: ""), albumCover: album.coverSmall)){
                                        ZStack{
                                            AsyncImage(url: URL(string: album.coverSmall))
                                                .padding(4)
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .frame(width:300,height:65,alignment:
                                                .leading)
                                                .background(.gray)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            HStack{
                                                
                                                Text("\(album.title)")
                                                    .frame(width:220,height:65,alignment: .leading)
                                                    .foregroundColor(.black).offset(x:27)
                                                
                                            }
                                                
                                           
                                        }
                                        
                                    }
                                    
                                    
                                
                            
                        }
                        
                    }
                    
                }.onAppear(perform: {abdVM.fetchAlbumDetails(String(albumDetail.id))})
                
            
        }
        
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(albumDetail: .init(id: 117, title: "Album Title", link: "", cover: "", coverSmall: "https://e-cdns-images.dzcdn.net/images/cover/ffd88577ab6fdc7e9d81b8b6e576f0e9/56x56-000000-80-0-0.jpg", coverMedium: "", coverBig: "", coverXl: "", md5Image: "", genreID: 0, fans: 0, releaseDate: "", recordType: "", tracklist: "", explicitLyrics: false, type: ""))
    }
}
