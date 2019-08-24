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

        setUpViews()
        setupNavigationBar()
        getCityDetail(query: viewModel?.cityName)
    }
    
    func setUpViews(){
        self.tempCLabel.text = nil
        self.humidityLabel.text = nil
        self.descLabel.text = nil
        self.weatherImageView.image = nil
        
        weatherImageView.layer.cornerRadius = 20
        weatherImageView.clipsToBounds = true
    }

    private func setupNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateViews(){
        DispatchQueue.main.async {
           
            //Setting Image with anomation
            UIView.transition(with: self.view,
                              duration:0.8,
                              options: .transitionCrossDissolve,
                              animations: {
                                
                                self.tempCLabel.text = self.viewModel?.tempCFormattedText
                                self.humidityLabel.text = self.viewModel?.humidityFormattedText
                                self.descLabel.text = self.viewModel?.descFormattedText
                                
                                self.weatherImageView.image = self.viewModel?.weatherIconImage },
                              
                              completion: nil)
        }
    }
}


extension CityDetailViewController {
    func getCityDetail(query: String?){
        self.showLoader()
        guard let query = query else{
            return
        }
        service.getCityDetail(query: query) { (cityDetailBaseModel, error) in
            guard let cityDetailBaseModel = cityDetailBaseModel else{
                self.hideLoader()
                return
            }
            self.viewModel = CityDetailViewModel(value: cityDetailBaseModel)
            self.hideLoader()
            self.getWeatherIcon(path: self.viewModel?.weatherIconUrl)
            
        }
    }
    
    func getWeatherIcon(path : String?){
        showLoader()
        guard let path = path else{
            self.hideLoader()
            return
        }
        iconService.getProfilePic(path: path) { (image, error) in
            self.viewModel?.weatherIconImage = image

            self.hideLoader()
        }
    }
}
