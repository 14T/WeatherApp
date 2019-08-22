//
//  CityViewModel.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityViewModel {
    
    //MARK: - Properties
    public let city : String?
    public let region : String?
    public let country : String?


    //MARK: - Init
    init(value: SearchResultModel) {
        self.city = value.areaName?.first?.value
        self.region = value.region?.first?.value
        self.country = value.country?.first?.value


    }
    
    init(value : City) {
        self.city = value.name
        self.region = value.region
        self.country = value.country

//        self.region = value.region?.first?.value
//        self.country = value.country?.first?.value

    }

}


//MARK: - UI Representable Data
extension CityViewModel {
    
//    public var areaName: String? {
//        return areaName
//    }
//
//    public var profilePicPath: String? {
//        return contact?.profilePic
//    }
//    public var isFavourite: Bool {
//        return contact?.favorite ?? false
//    }
}
