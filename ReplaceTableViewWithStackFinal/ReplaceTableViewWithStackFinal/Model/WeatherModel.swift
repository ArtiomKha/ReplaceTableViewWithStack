//
//  WeatherModel.swift
//  ReplaceTableWithStackStarting
//
//  Created by Artsiom Khaliliayeu on 25.02.23.
//

import UIKit

struct WeatherModel {
	let day: String
	let minTemp: Double
	let maxTemp: Double
	let isCloudy: Bool

	var icon: UIImage? {
		return UIImage(named: isCloudy ? "cloudy" : "sun")
	}

	var minTempString: String {
		String(format: "%.1f°C", minTemp)
	}

	var maxTempString: String {
		String(format: "%.1f°C", maxTemp)
	}

	static func getRandomForecast() -> [WeatherModel] {
		["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Suturday", "Sunday"].map { WeatherModel(day: $0, minTemp: Double.random(in: -10...5), maxTemp: Double.random(in: 5...15), isCloudy: Int.random(in: 1...4) % 2 == 0) }
	}
}
