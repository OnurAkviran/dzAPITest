//
//  CategoryArtistViewModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 11.05.2023.
//

import Foundation

final class CategoryArtistViewModel: ObservableObject {
    @Published var categoryArtists: [CategoryArtist] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    func fetchCategoryArtists() {
        hasError = false
        let categoryArtistUrl = "https://api.deezer.com/genre/116/artists"
        
        if let url = URL(string: categoryArtistUrl) {
            URLSession.shared.dataTask(with: url){ data,response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.hasError = true
                        self.error = UserError.custom(error: error)
                    } else {
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let categoryArtists = try decoder.decode(CategoryArtistResponse.self, from: data)
                                self.categoryArtists = categoryArtists.data
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


extension CategoryArtistViewModel{
    
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
