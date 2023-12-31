//
//  MusicTableViewCell.swift
//  Search Music
//
//  Created by KwokWing Tong on 5/8/2023.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
	
	@IBOutlet weak var albumArtImageView: UIImageView!
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var artistLabel: UILabel!
	@IBOutlet weak var bookmarkButton: UIButton!
	
	var callbackButtonClicked : ((UIButton) -> Void)?
	
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
	
	@IBAction func bookmarkSong(_ sender: UIButton) {
		sender.isSelected = !sender.isSelected
		self.callbackButtonClicked?(sender)
	}
	
}
