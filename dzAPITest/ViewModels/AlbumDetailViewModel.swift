//
//  AlbumDetailViewModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import Foundation

final class AlbumDetailViewModel: ObservableObject {
    @Published var albumDetails: [AlbumDetail] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    func fetchAlbumDetails(_ artistString:String){
        hasError = false
        let albumDetailsUrl = "https://api.deezer.com/artist/\(artistString)/albums"
        
        if let url = URL(string: albumDetailsUrl) {
            URLSession.shared.dataTask(with: url){ data,response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.hasError = true
                        self.error = UserError.custom(error: error)
                    } else {
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let albumDetails = try decoder.decode(AlbumDetailResponse.self, from: data)
                                self.albumDetails = albumDetails.data
                                return
                            } catch {
                                print(error)
                            }
                        } else {
                            self.hasError = true
                            self.error = UserError.failedToDecode
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchTrackList() {
        
    }
}

    


extension AlbumDetailViewModel{
    
    enum UserError: LocalizedError{
        case custom(error: Error)
        case failedToDecode
        
        var errorDescription: String?{
            switch self{
            case .failedToDecode:
                return "Failed to decode"
            case .custom(let error):
                return error.localizedDescription
            }
            
            
            
        }
    }
}

