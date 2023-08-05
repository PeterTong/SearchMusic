//
//  SearchMusicViewModel.swift
//  Search Music
//
//  Created by KwokWing Tong on 4/8/2023.
//

import Foundation

class SearchMusicViewModel {
	
	func searchMusic(with keyword: String, completion: @escaping (MusicListViewModel) -> Void) {
		
		let searchMusicURL = Constants.Urls.searchingMusicWithKeyword(keyword: keyword)
		
		let searchMusicResource = Resource(url: searchMusicURL) { data in
			let searchMusicResponse = try? JSONDecoder().decode(SearchMusicResponse.self, from: data)
			return searchMusicResponse
		}
		
		Webservice().load(resource: searchMusicResource) { result in
			if let musicResponse = result {
				let vm = MusicListViewModel(music: musicResponse)
				completion(vm)
			}
		}
	}
	
}
