//
//  ViewController.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 1/8/2023.
//

import UIKit

class SearchMusicViewController: UIViewController {
	// MARK: - Properties
	@IBOutlet weak var tableView: UITableView!
	
	let searchController = UISearchController(searchResultsController: nil)
	var musicListViewModel = MusicListViewModel(music: SearchMusicResponse(resultCount: 0, results: []))
	
	// MARK: - Methods

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		// navigation title
		navigationItem.title = Bundle.main.appName
		if #available(iOS 13.0, *) {
			let appearance = UINavigationBarAppearance()
			appearance.titleTextAttributes = [.foregroundColor: UIColor.AppColor.blue]
			navigationItem.standardAppearance = appearance
			navigationItem.scrollEdgeAppearance = appearance
		} else {
			navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.AppColor.blue]
		}
		
		 
		// search Controller
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = NSLocalizedString("SearchMusicViewController_searchBar_placeholder", comment: "")
		navigationItem.searchController = searchController
		definesPresentationContext = true
		
		
		
	}


}

// MARK: - Extensions
extension SearchMusicViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		let searchBar = searchController.searchBar
		let searchMusicModel = SearchMusicViewModel()
		searchMusicModel.searchMusic(with: searchBar.text ?? "") { musicListViewModel in
			print(musicListViewModel.musicViewModel)
			self.musicListViewModel = musicListViewModel
			self.tableView.reloadData()
		}

	}
}

extension SearchMusicViewController: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.musicListViewModel.numberOfRows(section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
		
		let music = self.musicListViewModel.modelAt(indexPath.row)
		cell.configure(music)
		return cell
		
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	
	
	
	
}



