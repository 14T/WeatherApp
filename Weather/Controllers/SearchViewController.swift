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
    let service = SearchCityService()

    var viewModel : SearchViewModel? {
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
        setupSearchController()
        searchCity(query: "Singapore")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            self.searchController.isActive = true
//        }
        
    }
    
    private func setupTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: CityTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CityTableViewCell.self))
        tableView.keyboardDismissMode = .interactive
    }
    private func setupNavigationBar(){
        self.title = "Search Cities"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    private func setupSearchController(){
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Type here to Search Cities ..."
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    
        searchController.searchBar.delegate = self
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter
    }

    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - SearchController delegates
extension SearchViewController: UISearchControllerDelegate{
//    func didPresentSearchController(_ searchController: UISearchController) {
//        DispatchQueue.main.async {
//            searchController.searchBar.becomeFirstResponder()
//        }
//    }
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
        
        service.searchCity(query: query) { (result, error) in
            guard let result = result else {
                debugPrint("SearchCityService: EMPTY")
                return
            }
            self.viewModel = SearchViewModel(values: result)
            debugPrint("SearchCityService : \(result), error : \(error ?? "")")
        }
    }
}


extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = CityDetailViewController.instantiate() else {
            return
        }
        detailViewController.title = viewModel?.cities[indexPath.row].city
        
        if let cityViewModel = viewModel?.cities[indexPath.row] {
            detailViewController.viewModel = CityDetailViewModel(value: cityViewModel)
        }
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityTableViewCell.self), for: indexPath) as? CityTableViewCell else {
            precondition(false, "CityTableViewCell not available")
        }
        cell.viewModel = viewModel?.cities[indexPath.row]
        return cell
        
    }
    
    
    
}

