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
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                    .ignoresSafeArea()
                ScrollView{
                    ForEach(gVM.genres.chunked(into: 2), id:\.self) { chunk in
                        HStack{
                            ForEach(chunk, id: \.name) { genre in
                                LazyVStack{
                                    NavigationLink(destination: CategoryArtistView(categoryArtist: .init(id: 0, radio: true, name: "s", picture: "s", tracklist: "s", type: "s", pictureSmall: "s", pictureMedium: "s", pictureBig: "s", pictureXl: "s"), categoryName: genre.name)){
                                        VStack(){

                                            ZStack(alignment: .bottom){

                                                AsyncImage(url: URL(string: genre.picture)).clipShape(RoundedRectangle(cornerRadius: 20))
                                                Text(genre.name).padding(5)
                                                    .background(.black).clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                                    .offset(y:-5)

                                            }
                                    }.padding(20)
                                }
                                    
                                }
                        }
                    }
                    
     

                    }
                }
                
                
            }
           
            
        }.onAppear(perform: gVM.fetchGenres)
        
        
        
    }
    
    
    
    struct GenreView_Previews: PreviewProvider{
        
        static var previews: some View{
            GenreView(genre: .init(id: 0, name: "s", picture: "https://api.deezer.com//artist//8354140//image", type: "type", pictureSmall: "PicS", pictureMedium: "picM", pictureBig: "picB", pictureXl: "picXL"))
        }
    }
    
}