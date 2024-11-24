//
//  JobDescriptionViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/19/24.
//

import UIKit

class JobDetailsViewController: UIViewController {

    let jobDetailsView = JobDetailsView()
    
    override func loadView() {
        view = jobDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Job Description"
        
        // Do any additional setup after loading the view.
    }

}
