//
//  MediaType.swift
//  Search Music
//
//  Created by KwokWing Tong on 6/8/2023.
//

import Foundation

struct MediaType: Decodable {
	let name: Name
	
	enum Name: Decodable {
		case music
		case musicVideo
		case movie
		
	}
}

extension MediaType.Name: CaseIterable { }

extension MediaType.Name: RawRepresentable {
	typealias RawValue = String
	
	init?(rawValue: RawValue) {
		switch rawValue {
		case "music": self = .music
		case "musicVideo": self = .musicVideo
		case "movie": self = .movie
		default: return nil
		}
	}
	
	var displayName: RawValue {
		switch self {
		case .music: return NSLocalizedString("SearchMusicViewController_searchBar_scopeButtonTitles_music", comment: "")
		case .musicVideo: return NSLocalizedString("SearchMusicViewController_searchBar_scopeButtonTitles_musicVideo", comment: "")
		case .movie: return NSLocalizedString("SearchMusicViewController_searchBar_scopeButtonTitles_movie", comment: "")
		}
	}
	
	var rawValue: RawValue {
		switch self {
		case .music: return "music"
		case .musicVideo: return "musicVideo"
		case .movie: return "movie"
		}
	}
}
