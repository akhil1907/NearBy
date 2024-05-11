//
//  Venue.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation


struct Venues: Codable{
    
    var venues: [Venue]
    
}


struct Venue: Codable{
    
    var name_v2: String
    var postal_code: String
    var name: String
    var address: String
    var country: String
    var slug: String
    var city: String
    var extended_address: String
    var url: String
    
    
}
