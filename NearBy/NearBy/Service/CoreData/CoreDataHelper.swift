//
//  CoreDataHelper.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelName")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveVenue(_ venue: [Venue]) {
        let context = persistentContainer.viewContext
        for venue in venue{
            var venueEntity = NSEntityDescription.entity(forEntityName: "VenueEntity", in: context) as? Venue
            
            venueEntity?.name = venue.name
            venueEntity?.address = venue.address
            
            
            do {
                try context.save()
            } catch {
                print("Failed to save venue: \(error)")
            }
        }
    }
//    
    func fetchVenues() -> [Venue]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "VenueEntity")
        
        do {
            let venueEntities = try context.fetch(fetchRequest)
            let venues = venueEntities.map { venueEntity -> Venue in
                print(venueEntity)
                return Venue(name_v2: "", postal_code: "", name: "", address: "", country: "", slug: "", city: "", extended_address: "", url: "")
            }
            return venues
        } catch {
            print("Failed to fetch venues: \(error)")
            return []
        }
    }
}
