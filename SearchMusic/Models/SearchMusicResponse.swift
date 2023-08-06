//
//  Music.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 2/8/2023.
//

import Foundation


struct SearchMusicResponse: Decodable{
	let resultCount: Int
	let results: [Music]
}

struct Music: Codable{
	let wrapperType: String
	let kind: String
	let artistId: Int?
	let trackId: Int
	let artistName: String
	let trackName: String
	let artistViewUrl: String?
	let trackViewUrl: String
	let previewUrl: String
	let artworkUrl60: String
	let country: String
}
