//
//  TrackListModel.swift
//  dzAPITest
//
//  Created by Gazi Akviran on 12.05.2023.
//
import Foundation


struct TracklistResponse: Codable {
    let data: [TracklistDetail]
}

struct TracklistDetail: Codable {
    let id: Int
    let readable: Bool
    let title, titleShort, titleVersion, isrc: String
    let link: String
    let duration, trackPosition, diskNumber, rank: Int
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    let preview: String


    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case isrc, link, duration
        case trackPosition = "track_position"
        case diskNumber = "disk_number"
        case rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview

    }
}
