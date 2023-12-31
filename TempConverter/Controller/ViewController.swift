//
//  ViewController.swift
//  TempConverter
//
//  Created by anna.zubakina on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider!
    {
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          updateTempLabelFromSlider(value: tempSlider.value)
      }
      
 
    @IBAction func sliderValueChanged(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    
      func updateTempLabelFromSlider(value: Float) {
          let celsiusTemperature = Int(value)
          var convertedTemperature: Double = 0.0
          let (fahrenheitTemperature, kelvinTemperature) = convertTempFrom(celsius: celsiusTemperature)
          
          let selectedSegmentIndex = tempSegmentControl.selectedSegmentIndex
          
          
          switch selectedSegmentIndex {
          case 0: // fahrenheit
              convertedTemperature = fahrenheitTemperature
              convertedTempLabel.text = "\(convertedTemperature) F"
          case 1: // kelvin
              convertedTemperature = kelvinTemperature
              convertedTempLabel.text = "\(convertedTemperature) K"
          default:
              break
          }
          
          celsiusLabel.text = "\(celsiusTemperature) °C"
          
          TemperatureManager.shared.setTemperature(convertedTemperature)
      }
      
      func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
          let fahrenheit = Double(celsius) * 9/5 + 32
          let kelvin = Double(celsius) + 273.15
          return (fahrenheit, kelvin)
      }
  }

