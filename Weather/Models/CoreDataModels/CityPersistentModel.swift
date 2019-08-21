//
//  CityPersistentModel.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import CoreData

extension City {
    static func create(name: String, region: String, country: String, in context: NSManagedObjectContext) {
       
        let newCity = City(context: context)
        newCity.name = name
        newCity.region = region
        newCity.country = country
        newCity.dateCreated = Date()
    }
    
}
