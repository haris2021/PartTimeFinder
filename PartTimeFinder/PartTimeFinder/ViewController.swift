//
//  ViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/19/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Home Screen"
        
        let jobDescription = JobDescriptionViewController()
        self.navigationController?.pushViewController(jobDescription, animated: true)
    }


}

