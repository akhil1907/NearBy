//
//  VenueDetailView.swift
//  NearBy
//
//  Created by Akhil Jain on 11/05/24.
//

import Foundation
import UIKit

class VenueDetailView: UIViewController{
    
    private var titleLabel = UILabel()
    private var bodyLabel = UILabel()
    private var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews(){
        view.backgroundColor = .gray
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        view.addSubview(textLabel)
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        textLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bodyLabel.heightAnchor.constraint(equalToConstant: 200),
            
            textLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textLabel.heightAnchor.constraint(equalToConstant: 200),
            
            
        ])
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24.0)
    }
    
    
    
    func configure(data: Venue){
        self.titleLabel.text = data.name
        self.bodyLabel.text = data.url
        self.textLabel.text = "Please use above url link to book tickets to this exciting place"
    }
    
}
