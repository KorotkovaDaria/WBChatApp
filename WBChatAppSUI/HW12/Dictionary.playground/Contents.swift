import UIKit

// Создание словаря с городами и их населением
var cityPopulation: [String: Int] = [
    "Москва": 12615279,
    "Санкт-Петербург": 5383968,
    "Новосибирск": 1625631
]

// Вывод всех ключей (названий городов) словаря
print(cityPopulation.keys)
// Вывод всех значений (населения городов) словаря
print(cityPopulation.values)
// Вывод всего словаря
print(cityPopulation)

// Добавление новых городов и их населения в словарь
cityPopulation["Екатеринбург"] = 1493749
cityPopulation["Самара"] = 1134746
cityPopulation["Омск"] = 1154116
print(cityPopulation)

// Удаление города "Омск" из словаря
cityPopulation.removeValue(forKey: "Омск")
print(cityPopulation)

// Обновление значения населения для города "Самара"
cityPopulation.updateValue(1174746, forKey: "Самара")
print(cityPopulation)

// Получение значения населения для города "Москва"
let populationMoskow = cityPopulation["Москва"]
print(populationMoskow ?? "")
