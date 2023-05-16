//
//  Weather.swift
//  WeatherApp
//
//  Created by 김형관 on 2021/10/05.
//

import Foundation

public struct Weather {
    let location: String
    let temperature: String
    let windspeed: String
    let rain: String
    let snow: String

    init(location: String,temperature: String, windspeed: String, rain: String,snow: String) {
        self.location = location
        self.temperature = temperature
        self.windspeed = windspeed
        self.rain = rain
        self.snow = snow
    }
}
