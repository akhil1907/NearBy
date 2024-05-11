//
//  NearByApiService.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation

class NearByApiService{
    
    private var base_Url = "https://api.seatgeek.com/2/venues"
    private let page_Size = 10
    private let client_Id = "Mzg0OTc0Njl8MTcwMDgxMTg5NC44MDk2NjY5"
    
    func fetchListOfVenues(page: Int, completion: @escaping (Venues?, Error?) -> Void){
        
        if let requiredUrl = getRequiredUrlForQueryParams(page: page){
            
            URLSession.shared.dataTask(with: requiredUrl) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode(Venues.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }.resume()
            
        }
        
        
    }
    
    
    private func getRequiredUrlForQueryParams(page: Int) -> URL?{
        
        var url = base_Url
        url += "?" + "per_page=\(page_Size)"
        url += "&" + "page=\(page)"
        url += "&" + "client_id=\(client_Id)"
        
        if let url = URL(string: url){
            return url
        }
        
        return nil
        
        
    }
    
}
