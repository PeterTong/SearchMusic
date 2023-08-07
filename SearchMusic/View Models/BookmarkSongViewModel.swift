//
//  BookmarkSongViewModel.swift
//  Search Music
//
//  Created by KwokWing Tong on 7/8/2023.
//

import Foundation


class BookmarkSongViewModel {
	
	private var bookmarkSongs: Set<Music>
	private var saveKeys = "Bookmark"
	
	init() {
		// load saved data
		if let data = UserDefaults.standard.data(forKey: saveKeys) {
			do {
				// Create JSON Decoder
				let decoder = JSONDecoder()
				// Decode
				let bookmark = try decoder.decode(Set<Music>.self, from: data)
				bookmarkSongs = bookmark
			} catch {
				print("Unable to Decode it (\(error))")
				bookmarkSongs = []
			}
		}else{
			bookmarkSongs = []
		}
	
	}
	
	func contain(_ music: Music) -> Bool {
		return bookmarkSongs.contains(music)
	}
	
	func add(_ music: Music) {
		bookmarkSongs.insert(music)
		save()
	}
	
	func remove(_ music:Music) {
		bookmarkSongs.remove(music)
		save()
	}
	
	func save(){
		
		do {
			// Create JSON Encoder
			let encoder = JSONEncoder()
			
			// Encode Note
			let data = try encoder.encode(bookmarkSongs)
			UserDefaults.standard.set(data, forKey: saveKeys)
		} catch {
			print("Unable to Encode Note (\(error))")
		}
		
	}
	
	func count() -> Int {
		return bookmarkSongs.count
	}
	
	func modelAt(_ index: Int) -> Music {
		let i = bookmarkSongs.index(bookmarkSongs.startIndex, offsetBy: index)
		return bookmarkSongs[i]
	}
}
