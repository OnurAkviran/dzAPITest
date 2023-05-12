//
//  GenreView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 9.05.2023.
//

import SwiftUI

struct GenreView: View{
    @StateObject private var gVM = GenreViewModel()
    let genre: Genre
    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(stops:[Gradient.Stop(color: Color(red:87/255,green:108/255,blue:188/255), location: 0.02),Gradient.Stop(color:  Color(red:11/255,green:36/255,blue:71/255), location: 0.30)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                ScrollView{
                    ForEach(gVM.genres.chunked(into: 2), id:\.self) { chunk in
                        HStack{
                            ForEach(chunk, id: \.name) { genre in
                                LazyVStack{
                                    NavigationLink(destination: CategoryArtistView(categoryArtist: .init(id: genre.id, radio: true, name: "s", picture: "s", tracklist: "s", type: "s", pictureSmall: "s", pictureMedium: "s", pictureBig: "s", pictureXl: "s"), categoryName: genre.name)){
                                        VStack(){

                                            ZStack(alignment: .bottom){

                                                AsyncImage(url: URL(string: genre.picture)).clipShape(RoundedRectangle(cornerRadius: 20)).frame(width:180, height:180).background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 20))
                                                Text(genre.name).padding(5)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.caption).fontWeight(.heavy)
                                                    .foregroundColor(.white)
                                                    .offset(y:-5)

                                            }
                                    }.padding(20)
                                }
                                    
                                }
                        }
                    }
                    
     

                    }
                }.listStyle(.plain).navigationBarTitle("Categories", displayMode: .inline)
                    .alert(isPresented: $gVM.hasError, error: gVM.error){
                        Button(action: gVM.fetchGenres){
                            Text("try again")
                        }
                    }
                    .toolbarBackground(.regularMaterial)
                
                
            }
           
            
        }.onAppear(perform: gVM.fetchGenres)
        
        
        
    }
    
    
    
    struct GenreView_Previews: PreviewProvider{
        
        static var previews: some View{
            GenreView(genre: .init(id: 0, name: "s", picture: "https://api.deezer.com//artist//8354140//image", type: "type", pictureSmall: "PicS", pictureMedium: "picM", pictureBig: "picB", pictureXl: "picXL"))
        }
    }
    
}
