//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 05/11/24.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await presenter.getVideos()
        }
    }
}

// MARK: HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("list: ", list)
    }
}
