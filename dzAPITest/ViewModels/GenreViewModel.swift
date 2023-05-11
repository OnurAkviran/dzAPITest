//
//  GenreViewModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 9.05.2023.
//

import Foundation

final class GenreViewModel: ObservableObject {
    @Published var genres: [Genre] = []
    @Published var hasError = false
    @Published var error: UserError?
    
    
    func fetchGenres() {
        hasError = false
        let genreUrl = "https://api.deezer.com/genre"
        
        if let url = URL(string: genreUrl) {
            URLSession.shared.dataTask(with: url){ data,response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.hasError = true
                        self.error = UserError.custom(error: error)
                    } else {
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                let genres = try decoder.decode(GenreResponse.self, from: data)
                                self.genres = genres.data
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




//final class GenreViewModel: ObservableObject{
//
//    struct ApiResponse: Codable {
//        let data: [Genre]
//
//    }
//
//    @Published var genres: [Genre] = []
//    @Published var hasError = false
//    @Published var error: UserError?
//
//
//    func fetchGenres(){
//        hasError = false
//        let genreUrl = "https://api.deezer.com/genre"
//
//        if let url = URL(string: genreUrl){
//
//            URLSession.shared.dataTask(with: url){ [weak self] data,response, error in
//
//                DispatchQueue.main.async {
//
//                    if let error = error{
//                        self?.hasError = true
//                        self?.error = UserError.custom(error: error)
//                    }
//
//                    else{
//
//                        let decoder = JSONDecoder()
//                        //decoder.keyDecodingStrategy = .useDefaultKeys
//
//                        if let data = data,
//                            let genres = try? decoder.decode([Genre].self, from: data){
//
//                            self?.genres = genres
//                        }
//
//                        else{
//                            self?.hasError = true
//                            self?.error = UserError.failedToDecode
//                        }
//                    }
//                }
//            }.resume()
//        }
//    }
//}


extension GenreViewModel{
    
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
