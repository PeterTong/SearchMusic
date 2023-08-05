//
//  Music.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 2/8/2023.
//

import Foundation


struct SearchMusicResponse: Decodable{
	let resultCount: Int
	let results: [results]
}

struct results: Decodable{
	let wrapperType: String
	let kind: String
	let artistId: Int
	let collectionId: Int
	let trackId: Int
	let artistName: String
	let collectionName: String
	let trackName: String
	let artistViewUrl: String
	let collectionViewUrl: String
	let trackViewUrl: String
	let previewUrl: String
	let artworkUrl60: String
	let country: String
}
