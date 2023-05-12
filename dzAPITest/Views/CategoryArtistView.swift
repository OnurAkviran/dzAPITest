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
                RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    ForEach(caVM.categoryArtists.chunked(into: 2), id:\.self){ chunk in
                        HStack{
                            ForEach(chunk, id:\.name){ artist in
                                LazyVStack(){
                                    
                                    NavigationLink(destination: ArtistDetailView(artistDetail: .init(id: artist.id, name: artist.name, link: "", share: "", picture: artist.picture, pictureSmall: "", pictureMedium: artist.pictureMedium, pictureBig: "", pictureXl: "", nbAlbum: 0, nbFan: 0, radio: false, tracklist: "", type: ""))){
                                            ZStack(alignment: .bottom){
                                                
                                                
                                                
                                                AsyncImage(url: URL(string: artist.picture)).clipShape(RoundedRectangle(cornerRadius: 20)).frame(width:180,height:180).background(.black).clipShape(RoundedRectangle(cornerRadius: 20))
                                                Text(artist.name).padding(5)
                                                    .background(.black).clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                                    .offset(y:-5).fontWeight(.heavy)
                                            }
                                        }
                                        
                                    
                                
                            }
                                
                                
                            }
                        }
                        
                    }
                    
                }.listStyle(.plain).navigationBarTitle("\(categoryName) Artists", displayMode: .inline).toolbarBackground(Color(red: 0.1, green: 0.2, blue: 0.45), for: .navigationBar).onAppear(perform:{caVM.fetchCategoryArtists(String(categoryArtist.id))})
            }
            
            
        }
        
    }
    
    struct CategoryArtistView_Previews: PreviewProvider {
        static var previews: some View {
            CategoryArtistView(categoryArtist: .init(id: 0, radio: true, name: "Sago", picture: "https://e-cdns-images.dzcdn.net/images/artist/861348e7f8b6d93d3e2fff5ea6df2dcd/120x120-000000-80-0-0.jpg", tracklist: "tracklist", type: "type", pictureSmall: "picS", pictureMedium: "picM", pictureBig: "picB", pictureXl: "picXL"), categoryName: "name")
        }
    }
}
