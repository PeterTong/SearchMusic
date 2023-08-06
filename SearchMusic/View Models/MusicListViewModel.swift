//
//  MusicListViewModel.swift
//  Search Music
//
//  Created by KwokWing Tong on 4/8/2023.
//

import Foundation


class MusicListViewModel {
	
	let music: SearchMusicResponse
	let musicViewModel: [Music]
	
	init(music: SearchMusicResponse) {
		self.music = music
		self.musicViewModel = music.results
	}
	
	func numberOfRows(_ section: Int) -> Int {
		return musicViewModel.count
	}
	
	func modelAt(_ index: Int) -> Music {
		return musicViewModel[index]
	}
	
}




