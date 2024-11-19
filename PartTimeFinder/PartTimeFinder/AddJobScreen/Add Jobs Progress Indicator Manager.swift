//
//  AddJobsProgressIndicateManager.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/19/24.
//

import Foundation

extension AddJobsViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
