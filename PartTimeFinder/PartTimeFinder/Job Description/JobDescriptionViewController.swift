//
//  JobDescriptionViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/19/24.
//

import UIKit

class JobDescriptionViewController: UIViewController {

    let jobDescription = JobDescription()
    
    override func loadView() {
        view = jobDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Job Description"
        
        // Do any additional setup after loading the view.
    }

}
