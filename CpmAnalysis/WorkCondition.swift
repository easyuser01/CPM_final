//
//  WorkCondition.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/03.
//

import Foundation

func generateAndValidateSchedule(for works: [CriteriaData], with weatherList: [Weather]) -> [String: Bool] {
    var schedule: [String: Bool] = [:]
    for work in works {
        for weather in weatherList {
            // 날씨 조건 확인
            let isTemperatureOkay = Double(weather.temperature) ?? 0 >= work.temperaturemin && Double(weather.temperature) ?? 0 <= work.temperaturemax
            let isRainOkay = Double(weather.rain) ?? 0 <= work.rainfall
            let isSnowOkay = Double(weather.snow) ?? 0 <= work.snow
            let isWindOkay = Double(weather.windspeed) ?? 0 <= work.wind
            // 모든 조건이 충족되면 작업 가능
            if isTemperatureOkay && isRainOkay && isSnowOkay && isWindOkay {
                schedule[work.type] = true
            } else {
                // 하나라도 충족되지 않으면 작업이 지연됩니다.
                schedule[work.type] = false
            }
        }
    }
    return schedule
}


let criteriaList = CriteriaList()
let criterias = criteriaList.getCriterias()

let weatherconsideredschedule = generateAndValidateSchedule(for: criterias, with: Weatherlist)


