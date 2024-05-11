//
//  AppInteractor.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation

protocol AppInteractorDelegate: AnyObject {
    func didRecieveListOfVenues(venues: Venues)
}

class AppInteractor: AppPresenterInterface{
    
    weak var delegate: AppInteractorDelegate?
    
    func fetchListOfVenues(for page: Int) {
        NearByApiService().fetchListOfVenues(page: page) { data, error in
            if let data = data {
                    self.delegate?.didRecieveListOfVenues(venues: data)
            }
        }
    }
    
    
}
