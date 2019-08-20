//
//  ViewController.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)

    var cities = [SearchResultModel]()
    var filteredCities = [SearchResultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearchController()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.searchController.isActive = true
        }
    }
    

    private func setupNavigationBar(){
        self.title = "Cities"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupSearchController(){
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type here to Search Cities ..."
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    
        searchController.searchBar.delegate = self
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter
    }


}

extension SearchViewController: UISearchControllerDelegate{
    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {


    }
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchCity(query: searchBar.text)
    }
}

//Network Service
extension SearchViewController {

    func searchCity(query: String?){
        guard let query = query, !query.isEmpty else{
            return
        }
        
        let service = SearchCityService()
        
        service.searchCity(query: query) { (result, error) in
            
            debugPrint("SearchCityService : \(result), error : \(error)")
        }
    }
}

