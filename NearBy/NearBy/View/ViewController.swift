//
//  ViewController.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import UIKit

protocol AppViewInterface{
    func fetchListOfVenues(for page: Int)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AppPresenterDelegate{

    private var activityIndicator = UIActivityIndicatorView(style: .large)
    @IBOutlet weak var nearByAppTableView: UITableView!
    
    private var venues: Venues?
    var currentPage = 0
    var presenter = AppPresenter()
    var interactor = AppInteractor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActivityIndicator()
        nearByAppTableView.delegate = self
        nearByAppTableView.dataSource = self
        nearByAppTableView.register(UINib(nibName: "NearByAppTableViewCell", bundle: nil), forCellReuseIdentifier: "NearByAppTableViewCell")
        presenter.delegate = self
        interactor.delegate = presenter
//        if let venue = CoreDataHelper.shared.fetchVenues(){
//            self.venues?.venues = venue
//            nearByAppTableView.reloadData()
//        }
        presenter.configureDependencies(interactor: interactor)
        
        // Do any additional setup after loading the view.
    }
    
    private func setUpActivityIndicator(){
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues?.venues.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NearByAppTableViewCell", for: indexPath) as? NearByAppTableViewCell{
            if let data = venues?.venues[indexPath.row] {
                cell.configure(venue: data)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let requestedPage = ceil(scrollView.contentOffset.y / (800.0))
        
        if (requestedPage >= CGFloat(currentPage)){
            activityIndicator.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                self.loadNextPage()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = venues?.venues[indexPath.row]{
            let viewContoller = VenueDetailView()
            viewContoller.configure(data: data)
            present(viewContoller, animated: true)
        }
        
    }
    
    private func loadNextPage(){
        currentPage += 1
        activityIndicator.startAnimating()
        presenter.fetchListOfVenues(for: currentPage)
    }
    
    
    //MARK: AppPresenterDelegate Methods
    
    func didRecieveListOfVenues(venues: Venues) {
        self.venues = venues
//        CoreDataHelper.shared.saveVenue(venues.venues)
        self.nearByAppTableView.reloadData()
        activityIndicator.stopAnimating()
    }
    


}

