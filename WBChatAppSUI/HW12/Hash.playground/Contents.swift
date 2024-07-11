import UIKit
// Функция, возвращающая хеш строки, используя встроенную функцию hash()
func getHash(of string: String) -> Int {
    return string.hash
}

let sampleString = "Hello"
let builtinHash = getHash(of: sampleString)
print("Hash for '\(sampleString)': \(builtinHash)")


// Функция, возвращающая собственный хеш строки
func getCustomHash(of string: String) -> Int {
    // Начальное значение хеша
    var hash = 0
    // Простое число для умножения (можно выбрать любое другое)
    let number = 25
    
    for char in string {
        // Обновление значения хеша: умножение текущего значения на простое число и добавление ASCII значения символа
        hash = hash &* number &+ Int(char.asciiValue ?? 0)
        //Используем &* для умножения и &+ для сложения, чтобы обработать возможные переполнения.
    }
    
    
    return hash
}

let stringHash = "Hello"
let customHash = getCustomHash(of: stringHash)
print("Custom hash of '\(stringHash)': \(customHash)")
