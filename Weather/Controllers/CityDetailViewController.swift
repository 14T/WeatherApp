//
//  CityDetailViewController.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController, StoryboardInstantiable {
    static var storyboardName: String = "CityDetailStoryboard"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    

    private func setupNavigationBar(){
        self.title = "Details"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
}
