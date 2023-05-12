//
//  CategoryArtistView.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 11.05.2023.
//

import SwiftUI




struct CategoryArtistView: View {
    @StateObject private var caVM = CategoryArtistViewModel()
    let categoryArtist: CategoryArtist
    let categoryName: String
    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(stops:[Gradient.Stop(color: Color(red:87/255,green:108/255,blue:188/255), location: 0.02),Gradient.Stop(color:  Color(red:11/255,green:36/255,blue:71/255), location: 0.30)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                ScrollView{
                    
                    ForEach(caVM.categoryArtists.chunked(into: 2), id:\.self){ chunk in
                        HStack{
                            ForEach(chunk, id:\.name){ artist in
                                LazyVStack(){
                                    
                                    NavigationLink(destination: ArtistDetailView(artistDetail: .init(id: artist.id, name: artist.name, link: "", share: "", picture: artist.picture, pictureSmall: "", pictureMedium: artist.pictureMedium, pictureBig: "", pictureXl: "", nbAlbum: 0, nbFan: 0, radio: false, tracklist: "", type: ""))){
                                            ZStack(alignment: .bottom){
                                                
                                                
                                                
                                                AsyncImage(url: URL(string: artist.picture)).clipShape(RoundedRectangle(cornerRadius: 20)).frame(width:180,height:180).background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 20))
                                                Text(artist.name).padding(5)
                                                    .background(.clear).clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.title3)
                                                    .foregroundColor(.white)
                                                    .offset(y:0).fontWeight(.medium)
                                            }
                                        }
                                        
                                    
                                
                            }
                                
                                
                            }
                        }
                        
                    }
                    
                }.listStyle(.plain).navigationBarTitle("\(categoryName) Artists", displayMode: .inline).toolbarBackground(.regularMaterial).onAppear(perform:{caVM.fetchCategoryArtists(String(categoryArtist.id))})
            }
            
            
        }
        
    }
    
    struct CategoryArtistView_Previews: PreviewProvider {
        static var previews: some View {
            CategoryArtistView(categoryArtist: .init(id: 0, radio: true, name: "Sago", picture: "https://e-cdns-images.dzcdn.net/images/artist/861348e7f8b6d93d3e2fff5ea6df2dcd/120x120-000000-80-0-0.jpg", tracklist: "tracklist", type: "type", pictureSmall: "picS", pictureMedium: "picM", pictureBig: "picB", pictureXl: "picXL"), categoryName: "name")
        }
    }
}
