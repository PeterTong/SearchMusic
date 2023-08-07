//
//  BookmarkSongViewController.swift
//  Search Music
//
//  Created by KwokWing Tong on 7/8/2023.
//

import UIKit

class BookmarkSongViewController: UIViewController {
	// MARK: - Properties
	@IBOutlet weak var tableView: UITableView!
	lazy var bookmarkSongViewModel = BookmarkSongViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		bookmarkSongViewModel = BookmarkSongViewModel()
		self.tableView.reloadData()
	}
	
	
}

// MARK: - Extension
extension BookmarkSongViewController: UITableViewDelegate, UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		bookmarkSongViewModel.count()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkSongTableViewCell", for: indexPath) as! BookmarkSongTableViewCell
		
		let music = self.bookmarkSongViewModel.modelAt(indexPath.row)
		cell.configure(music)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	
}
