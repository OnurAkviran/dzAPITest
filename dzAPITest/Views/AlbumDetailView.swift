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
                            
                                ZStack{
                                    
                                    AsyncImage(url: URL(string: album.coverSmall))
                                        .padding(4)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .frame(width:300,height:65,alignment:
                                        .leading)
                                        .background(.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                    Text("\(album.title)").offset(x:20)
                                    
                                    
                                }
                            
                        }
                        
                    }
                    
                }.onAppear(perform: abdVM.fetchAlbumDetails)
                
            
        }
        
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(albumDetail: .init(id: 0, title: "Album Title", link: "", cover: "", coverSmall: "https://e-cdns-images.dzcdn.net/images/cover/ffd88577ab6fdc7e9d81b8b6e576f0e9/56x56-000000-80-0-0.jpg", coverMedium: "", coverBig: "", coverXl: "", md5Image: "", genreID: 0, fans: 0, releaseDate: "", recordType: "", tracklist: "", explicitLyrics: false, type: ""))
    }
}
