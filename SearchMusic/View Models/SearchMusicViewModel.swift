//
//  SearchMusicViewModel.swift
//  Search Music
//
//  Created by KwokWing Tong on 4/8/2023.
//

import Foundation

class SearchMusicViewModel {
	
	func searchMusic(with keyword: String,by pageNumber: Int,  mediaType: String, completion: @escaping (MusicListViewModel) -> Void) {
		
		let searchMusicURL = Constants.Urls.searchingMusicWithKeyword(keyword: keyword, pageNumber: pageNumber, mediaType: mediaType)
		
		let searchMusicResource = Resource(url: searchMusicURL) { data in
			
			do {
				let searchMusicResponse = try JSONDecoder().decode(SearchMusicResponse.self, from: data)
				return searchMusicResponse
			} catch  {
				print("JSONDecoder().decode Error: \(error.localizedDescription)")
				return nil
			}
			
		}
		
		Webservice().load(resource: searchMusicResource) { result in
			if let musicResponse = result {
				let vm = MusicListViewModel(music: musicResponse)
				completion(vm)
			}
		}
	}
	
}
