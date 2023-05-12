//
//  TracklistView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import SwiftUI

struct TracklistView: View {
    @StateObject private var tVM = TracklistViewModel()
    let tracklistDetail: TracklistDetail
    var albumCover: String = ""
    
    init(tracklistDetail: TracklistDetail, albumCover: String) {
            self.albumCover = albumCover
            self.tracklistDetail = tracklistDetail
        }
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                    .ignoresSafeArea()
                VStack{
                    Text(tracklistDetail.title).font(.title).fontWeight(.semibold).foregroundColor(.white)
                    
                    ScrollView{
                        ForEach(tVM.tracklistDetails, id: \.id){ track in
                            LazyVStack{
                                //Text("\(track.title)").offset(x:20)
                                
                                ZStack{
                                    AsyncImage(url: URL(string: albumCover))
                                        .padding(4)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .frame(width:300,height:65,alignment:
                                        .leading)
                                        .background(.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    HStack{
                                        
                                        Text("\(track.title)")
                                            .frame(width:200,height:65,alignment: .leading)
                                            .foregroundColor(.black).background(.clear).offset(x:30)
                        
                                        Text("❤️").offset(x:27)
                                        
                                        
                                    }
                                        
                                   
                                }
                                
                                
                            }
                            
                        }
                        
                    }.onAppear(perform: {tVM.fetchTracklist(String(tracklistDetail.id))})
                }
                
            }
            
                
                
            
        }
    }
}

struct TracklistView_Previews: PreviewProvider {
    static var previews: some View {
        TracklistView(tracklistDetail: .init(id: 356548137, readable: true, title: "", titleShort: "", titleVersion: "", isrc: "", link: "", duration: 0, trackPosition: 0, diskNumber: 0, rank: 0, explicitLyrics: true, explicitContentLyrics: 0, explicitContentCover: 0, preview: ""),albumCover: "https://e-cdns-images.dzcdn.net/images/cover/ffd88577ab6fdc7e9d81b8b6e576f0e9/56x56-000000-80-0-0.jpg")
        
    }
}
