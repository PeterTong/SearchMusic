//
//  BookmarkSongTableViewCell.swift
//  Search Music
//
//  Created by KwokWing Tong on 7/8/2023.
//

import UIKit

class BookmarkSongTableViewCell: UITableViewCell {

	@IBOutlet weak var albumArtImageView: UIImageView!
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var artistLabel: UILabel!

	func configure(_ music: Music) {
		styleUI()
		self.artistLabel.text = music.artistName
		self.songNameLabel.text = music.trackName
		self.albumArtImageView.loadImageUsingCache(withUrl: music.artworkUrl60)
	}
	
	func styleUI() {
		self.albumArtImageView.layer.cornerRadius = 8
		self.albumArtImageView.layer.masksToBounds = true
	}

}
