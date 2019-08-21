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
    
    let cityStore = CityStore()
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        //            self.searchController.isActive = true
        //        }
        
        tableView.reloadData()
        
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
        self.title = "Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    private func setupSearchController(){
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.placeholder = "Type here to search cities ..."
        searchController.dimsBackgroundDuringPresentation = false
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateViews()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        updateViews()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        searchCity(query: searchBar.text)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

//Network Service
extension SearchViewController {
    
    func searchCity(query: String?){
        guard let query = query, !query.isEmpty else{
            return
        }
        showLoader()

        self.viewModel = nil
        updateViews()
        service.searchCity(query: query) { (result, error) in
            guard let result = result else {
                debugPrint("SearchCityService: EMPTY")
                return
            }
            self.viewModel = SearchViewModel(values: result)
            self.hideLoader()
            debugPrint("SearchCityService : \(result), error : \(error ?? "")")
        }
    }
}


extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = CityDetailViewController.instantiate() else {
            return
        }
        
        if searchController.isActive  {
            guard let cityViewModel = viewModel?.cities[indexPath.row] else{
                return
            }
            cityStore.update(cityViewModel: cityViewModel)
            detailViewController.title = cityViewModel.city
            detailViewController.viewModel = CityDetailViewModel(value: cityViewModel)
            
            
        }
        else{
            let city = cityStore.lastTenCity[indexPath.row]
            let cityViewModel = CityViewModel(value: city)
            detailViewController.title = cityViewModel.city
            detailViewController.viewModel = CityDetailViewModel(value: cityViewModel)
            
        }
        
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard searchController.isActive else {
            return "Last Viewed"
        }
        return "Search Results"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard searchController.isActive else {
            let cities = cityStore.lastTenCity
            return cities.count
        }
        
        return viewModel?.cities.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityTableViewCell.self), for: indexPath) as? CityTableViewCell else {
            precondition(false, "CityTableViewCell not available")
        }
        
        guard searchController.isActive else {
            let citiy = cityStore.lastTenCity[indexPath.row]
            cell.viewModel = CityViewModel(value: citiy)
            return cell
            
        }
        
        cell.viewModel = viewModel?.cities[indexPath.row]
        
        return cell
        
    }
    
    
    
}

