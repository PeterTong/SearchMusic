//
//  UIColor+Hex.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 3/8/2023.
//

import UIKit

public extension UIColor {

		/// You can pass a hex with or without # and with or without alpha
		convenience init(hex: String) {
				var red: CGFloat = 0.0
				var green: CGFloat = 0.0
				var blue: CGFloat = 0.0
				var alpha: CGFloat = 1.0

				let cleanHex = hex.replacingOccurrences(of: "#", with: "")

				let scanner = Scanner(string: cleanHex)
				var hexValue: CUnsignedLongLong = 0
				if scanner.scanHexInt64(&hexValue) {
					if cleanHex.count == 6 {
								red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
								green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
								blue  = CGFloat(hexValue & 0x0000FF) / 255.0
						} else if cleanHex.count == 8 {
								alpha   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
								red = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
								green  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
								blue = CGFloat(hexValue & 0x000000FF)         / 255.0
						} else {
								print("invalid rgb string, length should be 6 or 8", terminator: "")
						}
				} else {
						print("scan hex error")
				}

				self.init(red:red, green:green, blue:blue, alpha:alpha)
		}
}
