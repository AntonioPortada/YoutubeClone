//
//  MainViewController.swift
//  YoutubeClone
//
//  Created by Antonio Portada on 05/11/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootPageVewController: RootPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRoot = self
            rootPageVewController = destination
        }
    }
}

extension MainViewController: RootPageProtocol {
    func currentPage(_ index: Int) {
        print("Current page: \(index)")
    }
}
