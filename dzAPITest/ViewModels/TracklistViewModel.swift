//
//  TracklistViewModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//

import Foundation

final class TracklistViewModel: ObservableObject {
    @Published var tracklistDetails: [TracklistDetail] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    // API request
    func fetchTracklist(_ albumTracklistString:String){
        hasError = false
        let tracklistDetailsUrl = "https://api.deezer.com/album/\(albumTracklistString)/tracks"
        
        if let url = URL(string: tracklistDetailsUrl) {
            URLSession.shared.dataTask(with: url){ data,response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.hasError = true
                        self.error = UserError.custom(error: error)
                    } else {
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let tracklistDetails = try decoder.decode(TracklistResponse.self, from: data)
                                self.tracklistDetails = tracklistDetails.data
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
    
}

    


extension TracklistViewModel{
    
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

