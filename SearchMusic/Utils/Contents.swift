//
//  Contents.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 3/8/2023.
//

import Foundation

struct Constants {
	
	struct Urls {
		
		static func searchingMusicWithKeyword(keyword: String) -> URL {
			
			// find the language parameter
			var lang = ""
			let locale = Locale.current.identifier
			if locale.contains("Hans") {
				lang = "zh_cn"
			}else if locale.contains("Hant"){
				lang = "zh_hk"
			}else{
				lang = "en_us"
			}
			let term = keyword.replacingOccurrences(of: " ", with: "+")
			let limit = 20
			let media = "music"
			
			return URL(string: "https://itunes.apple.com/search?term=\(term)&limit=\(limit)&media=\(media)&lang=\(lang)&explicit=No")!
		}
		
	}
	
}
