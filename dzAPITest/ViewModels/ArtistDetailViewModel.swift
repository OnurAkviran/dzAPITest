//
//  ArtistDetailViewModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import Foundation

final class ArtistDetailViewModel: ObservableObject {
    @Published var artistDetails: [ArtistDetail] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    func fetchArtistDetails() {
        hasError = false
        let artistDetailsUrl = "https://api.deezer.com/artist/117"
        
        if let url = URL(string: artistDetailsUrl) {
            URLSession.shared.dataTask(with: url){ data,response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.hasError = true
                        self.error = UserError.custom(error: error)
                    } else {
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let artistDetails = try decoder.decode(ArtistDetailResponse.self, from: data)
                                self.artistDetails = artistDetails.data
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

    


extension ArtistDetailViewModel{
    
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
