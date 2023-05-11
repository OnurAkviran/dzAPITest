//
//  GenreModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 9.05.2023.
//


//{"id":0,"name":"All",
//"picture":"https:\/\/api.deezer.com\/genre\/0\/image",
//"picture_small":"https:\/\/e-cdns-images.dzcdn.net\/images\/misc\/\/56x56-000000-80-0-0.jpg",
//"picture_medium":"https:\/\/e-cdns-images.dzcdn.net\/images\/misc\/\/250x250-000000-80-0-0.jpg",
//"picture_big":"https:\/\/e-cdns-images.dzcdn.net\/images\/misc\/\/500x500-000000-80-0-0.jpg",
//"picture_xl":"https:\/\/e-cdns-images.dzcdn.net\/images\/misc\/\/1000x1000-000000-80-0-0.jpg",
//"type":"genre"}

import Foundation

struct GenreResponse: Codable , Hashable{
    let data: [Genre]
}

struct Genre: Identifiable, Codable, Hashable{
    let id: Int
    let name, picture, type: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String

    enum CodingKeys: String, CodingKey {
        case id, name, picture, type
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
    }
}


