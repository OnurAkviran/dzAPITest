//
//  TracklistView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import SwiftUI
import AVFoundation
import AVFAudio

// SoundManager for 30-sec previews
class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

// TODO: Find a better way to implement like and play/pause toggles. Use a boolean array? Current implementation causes all tracks to toggle when one is tapped.
struct TracklistView: View {
    @StateObject private var tVM = TracklistViewModel()
    @StateObject private var soundManager = SoundManager()
    @State var nowPlaying = false
    @State var isLiked = false
    let tracklistDetail: TracklistDetail

    var albumCover: String = ""
    
    init(tracklistDetail: TracklistDetail, albumCover: String) {
            self.albumCover = albumCover
            self.tracklistDetail = tracklistDetail
        }
    
    var body: some View {
       
        NavigationStack{
            ZStack{
                //UI Background
                LinearGradient(gradient: Gradient(stops:[Gradient.Stop(color: Color(red:87/255,green:108/255,blue:188/255), location: 0.02),Gradient.Stop(color:  Color(red:11/255,green:36/255,blue:71/255), location: 0.30)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
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
                                        .frame(width:330,height:65,alignment:
                                        .leading)
                                        .background(Color(red:25/255,green:108/255,blue:188/255))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .onTapGesture {
                                            
                                            soundManager.playSound(sound: track.preview)
                                                            nowPlaying.toggle()
                                                            
                                                            if nowPlaying{
                                                                soundManager.audioPlayer?.play()
                                                            } else {
                                                                soundManager.audioPlayer?.pause()
                                                            }          
                                        }
                                    HStack{
                                        Image(systemName: nowPlaying ? "play.fill":"pause").fontWeight(.heavy).offset(x:20).foregroundColor(Color(red:165/255,green:215/255,blue:232/255))
                                        
                                        Text("\(track.title)")
                                            .frame(width:180,height:65,alignment: .leading)
                                            .foregroundColor(Color(red:165/255,green:215/255,blue:232/255)).background(.clear).offset(x:50)
                        
                                        Image(systemName:isLiked ? "heart.fill":"heart").offset(x:40)
                                            .fontWeight(.heavy)
                                            .onTapGesture {
                                                isLiked.toggle()
                                        }
                                        
                                        
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

// An init just to see in preview
struct TracklistView_Previews: PreviewProvider {
    static var previews: some View {
        TracklistView(tracklistDetail: .init(id: 356548137, readable: true, title: "", titleShort: "", titleVersion: "", isrc: "", link: "", duration: 0, trackPosition: 0, diskNumber: 0, rank: 0, explicitLyrics: true, explicitContentLyrics: 0, explicitContentCover: 0, preview: ""),albumCover: "https://e-cdns-images.dzcdn.net/images/cover/ffd88577ab6fdc7e9d81b8b6e576f0e9/56x56-000000-80-0-0.jpg")
        
    }
}
