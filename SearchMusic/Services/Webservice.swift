//
//  Webservice.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 3/8/2023.
//

import Foundation

struct Resource<T> {
	let url: URL
	let parse: (Data) -> T?
}

final class Webservice {
	
	func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
		
		URLSession.shared.dataTask(with: resource.url) { data, response, error in
			
			if let error = error {
				print("Webservice error:\(error.localizedDescription)")
				completion(nil)
			} else if let data = data {
				DispatchQueue.main.async {
					completion(resource.parse(data))
				}
			}
			
		}.resume()
		
	}
	
}
