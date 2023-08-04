//
//  ViewController.swift
//  SearchMusic
//
//  Created by KwokWing Tong on 1/8/2023.
//

import UIKit

class SearchMusicViewController: UIViewController {
	// MARK: - Properties
	let searchController = UISearchController(searchResultsController: nil)
	
	
	// MARK: - Methods

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// navigation title
		navigationItem.title = Bundle.main.appName
		if #available(iOS 13.0, *) {
			let appearance = UINavigationBarAppearance()
			appearance.titleTextAttributes = [.foregroundColor: UIColor.AppColor.blue]
//			appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.AppColor.blue]
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
//		let searchBar = searchController.searchBar

	}
}



