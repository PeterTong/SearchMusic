//
//  MusicViewModel.swift
//  Search Music
//
//  Created by KwokWing Tong on 4/8/2023.
//

import Foundation

class MusicListViewModel {
	
	let music: SearchMusicResponse
	let musicResults: [results]
	
	init(music: SearchMusicResponse) {
		self.music = music
		self.musicResults = music.results
	}

	
}
