//
//  AppPresenter.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation

protocol AppPresenterInterface{
    func fetchListOfVenues(for page: Int)
}

protocol AppPresenterDelegate: AnyObject {
    func didRecieveListOfVenues(venues: Venues)
}

class AppPresenter: AppViewInterface, AppInteractorDelegate{
    
    var interactor: AppPresenterInterface?
    weak var delegate: AppPresenterDelegate?
    
    public func configureDependencies(interactor: AppPresenterInterface){
        self.interactor = interactor
        fetchListOfVenues(for: 1)
    }
    
    func fetchListOfVenues(for page: Int) {
        interactor?.fetchListOfVenues(for: page)
    }
    
    
    
    
    //MARK: AppInteractorDelegate Methods
    
    func didRecieveListOfVenues(venues: Venues) {
        delegate?.didRecieveListOfVenues(venues: venues)
    }
    
   
    
}
