//
//  CityStore.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import CoreData

class CityStore: NSObject {
    
    // MARK: Private Properties
    private let persistenceManager = PersistenceManager()
    
    enum StoreKeys: String {
        case entityName = "City"
        case name
        case country
        case region
        case dateCreated
    }
    
    private lazy var fetchedResultsController: NSFetchedResultsController<City> = {
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: StoreKeys.dateCreated.rawValue, ascending: false)]
        fetchRequest.fetchOffset = 0
        fetchRequest.fetchLimit = 10
        
        let fetchedResultsControlelr = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.persistenceManager.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchedResultsControlelr.delegate = self
        
        return fetchedResultsControlelr
    }()

    private var cities: [City] {
        return fetchedResultsController.fetchedObjects ?? []
    }
    
    public var lastTenCity: [City] {
        let maxCount = self.cities.count > 10 ? 10 : self.cities.count
        return Array(self.cities.prefix(upTo: maxCount))
    }
    
    override init() {
        super.init()
        fetchCities()
    }
    
    // MARK: Public Methods

    
    func update(cityViewModel : CityViewModel? ) {
        
        guard let cityViewModel = cityViewModel, let name = cityViewModel.city else {
            return
        }
        let region = cityViewModel.region ?? ""
        let country = cityViewModel.country ?? ""

        /*get reference of managed object context*/
        let managedContext = persistenceManager.managedObjectContext
        
        /*init fetch request*/
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: StoreKeys.entityName.rawValue)
        fetchRequest.predicate = NSPredicate(format: "\(StoreKeys.name.rawValue) == %@ AND \(StoreKeys.region.rawValue) == %@ AND \(StoreKeys.country.rawValue) == %@", name, region, country)
        
        if let existingCities = try? managedContext.fetch(fetchRequest) , let existingCity = existingCities.first {
            existingCity.setValue(name, forKey: StoreKeys.name.rawValue)
            existingCity.setValue(region, forKey: StoreKeys.region.rawValue)
            existingCity.setValue(country, forKey: StoreKeys.country.rawValue)
            existingCity.setValue(Date(), forKey: StoreKeys.dateCreated.rawValue)

            saveChanges()
            return
        }
        else{
            City.create(name: name, region: region, country: country, in: persistenceManager.managedObjectContext)
            saveChanges()
        }
        
    }
    
    func deleteAll(){
        /*get reference of managed object context*/
        let managedContext = persistenceManager.managedObjectContext
        
        for item in cities{
            managedContext.delete(item)
        }
    }
    
    // MARK: Private Methods
    
    private func fetchCities() {
        do {
            try fetchedResultsController.performFetch()
            
            //            dump(fetchedResultsController.sections)
        } catch {
            fatalError()
        }
    }
    
    private func saveChanges() {
        guard persistenceManager.managedObjectContext.hasChanges else { return }
        do {
            try persistenceManager.managedObjectContext.save()
        } catch { fatalError() }
    }
}


//// MARK: CityStore + NSFetchedResultsControllerDelegate
extension CityStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        
        
    }
}
