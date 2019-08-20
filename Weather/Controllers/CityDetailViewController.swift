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
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var tempCLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    let service = CityDetailService()
    let iconService = WeatherIconService()

    public var viewModel : CityDetailViewModel? {
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
        getCityDetail(query: viewModel?.cityName)
    }
    

    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateViews(){
        DispatchQueue.main.async {
            self.tempCLabel.text = self.viewModel?.tempCText
            self.humidityLabel.text = self.viewModel?.humidityText
            self.descLabel.text = self.viewModel?.weatherDesc
            self.weatherImageView.image = self.viewModel?.weatherIconImage 
        }
    }
}


extension CityDetailViewController {
    func getCityDetail(query: String?){
        
        guard let query = query else{
            return
        }
        service.getCityDetail(query: query) { (cityDetailBaseModel, error) in
            guard let cityDetailBaseModel = cityDetailBaseModel else{
                return
            }
            self.viewModel = CityDetailViewModel(value: cityDetailBaseModel)
            self.getWeatherIcon(path: self.viewModel?.weatherIconUrl)
        }
    }
    
    func getWeatherIcon(path : String?){
        guard let path = path else{
            return
        }
        iconService.getProfilePic(path: path) { (image, error) in
            self.viewModel?.weatherIconImage = image
        }
    }
}
