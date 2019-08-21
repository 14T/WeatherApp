//
//  SearchViewModel.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchViewModel {
    
    //MARK: - Properties
    public var cities = [CityViewModel]()
//    //MARK: - Init
    init(values: [SearchResultModel]) {
        cities = values.compactMap({ return  CityViewModel(value: $0) })
    }
    
}
