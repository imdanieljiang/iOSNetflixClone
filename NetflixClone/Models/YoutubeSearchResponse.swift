//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Daniel Jiang on 4/18/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IDVideoElement
}

struct IDVideoElement: Codable {
    let kind: String
    let videoId: String
}
