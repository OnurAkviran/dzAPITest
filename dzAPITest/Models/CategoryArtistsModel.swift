//
//  ArtistModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 11.05.2023.
//

import Foundation

struct CategoryArtistResponse: Codable , Hashable{
    let data: [CategoryArtist]
}

//{
//         "id":8354140,
//         "name":"Ezhel",
//         "picture":"https:\/\/api.deezer.com\/artist\/8354140\/image",
//         "picture_small":"https:\/\/e-cdns-images.dzcdn.net\/images\/artist\/86897403b02175990e9d84322a94654a\/56x56-000000-80-0-0.jpg",
//         "picture_medium":"https:\/\/e-cdns-images.dzcdn.net\/images\/artist\/86897403b02175990e9d84322a94654a\/250x250-000000-80-0-0.jpg",
//         "picture_big":"https:\/\/e-cdns-images.dzcdn.net\/images\/artist\/86897403b02175990e9d84322a94654a\/500x500-000000-80-0-0.jpg",
//         "picture_xl":"https:\/\/e-cdns-images.dzcdn.net\/images\/artist\/86897403b02175990e9d84322a94654a\/1000x1000-000000-80-0-0.jpg",
//         "radio":true,
//         "tracklist":"https:\/\/api.deezer.com\/artist\/8354140\/top?limit=50",
//         "type":"artist"
//      }

struct CategoryArtist: Identifiable, Codable, Hashable{
    let id: Int
    let radio:Bool
    let name, picture, tracklist,type: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture, radio, tracklist, type
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
    }
}



