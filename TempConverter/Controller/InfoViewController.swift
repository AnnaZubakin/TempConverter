//
//  InfoViewController.swift
//  TempConverter
//
//  Created by anna.zubakina on 26/10/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var finalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temperature = TemperatureManager.shared.getTemperature()
           finalLabel.text = "temp.: \(temperature)"
        
    }
}

  
