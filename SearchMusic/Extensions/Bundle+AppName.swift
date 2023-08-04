//
//  Bundle+AppName.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 4/8/2023.
//

import Foundation

extension Bundle {
		var appName: String {

				if let displayName: String = self.infoDictionary?["CFBundleDisplayName"] as? String {
						return displayName
				} else if let name: String = self.infoDictionary?["CFBundleName"] as? String {
						return name
				}
				return ""
		}
}
