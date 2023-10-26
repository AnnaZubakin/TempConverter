//
//  TemperatureManager.swift
//  TempConverter
//
//  Created by anna.zubakina on 26/10/2023.
//

import Foundation

class TemperatureManager {
    static let shared = TemperatureManager()

    private var temperature: Double = 0.0

    func setTemperature(_ temperature: Double) {
        self.temperature = temperature
    }

    func getTemperature() -> Double {
        return temperature
    }
}
