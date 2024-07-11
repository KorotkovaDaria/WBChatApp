import UIKit


// Создание и вывод в консоль множества set
var set: Set = [1,2,3,4,5,6,7,8,9]
print(set)

// Добавление элементов в множество set
set.insert(10)
set.insert(11)
set.insert(0)
print(set)

// Удаление элемента из множества set
set.remove(0)
print(set)

// Проверка наличия элемента в множестве set
let isCotains = set.contains(9)
print(isCotains)

let isCotains1 = set.contains(0)
print(isCotains1)

// Создание множеств с животными
var setPetAnimal: Set = ["🐸","🐖","🐈","🐠","🦎","🐇","🦮","🦜","🦔","🐍"]
var setFarmAnimal: Set = ["🐄","🐂","🐐","🐖","🦃","🐓","🐎","🐏","🐑","🦙","🦆","🐝","🐇","🐠"]
var setExoticAnimal: Set = ["🐸","🐠","🦎","🦜","🦔","🐍","🐐","🐝","🐊","🐋","🦭","🐆","🦏","🐘"]

// Возвращает новое множество, содержащее только те элементы, которые присутствуют в обоих множествах.
print("--------------------------------intersection---------------------------------------")
var intersectionPetAndFarm = setPetAnimal.intersection(setFarmAnimal)
print(intersectionPetAndFarm)
var intersectionPetAndExotic = setPetAnimal.intersection(setExoticAnimal)
print(intersectionPetAndExotic)
var intersectionFarmAndExotic = setFarmAnimal.intersection(setExoticAnimal)
print(intersectionFarmAndExotic)

//Возвращает новое множество, содержащее элементы, которые присутствуют в одном из множеств, но не в обоих одновременно.
print("--------------------------------symmetricDifference---------------------------------------")
var differencePetAndFarm = setPetAnimal.symmetricDifference(setFarmAnimal)
print(differencePetAndFarm)
var differencePetAndExotic = setPetAnimal.symmetricDifference(setExoticAnimal)
print(differencePetAndExotic)
var differenceFarmAndExotic = setFarmAnimal.symmetricDifference(setExoticAnimal)
print(differenceFarmAndExotic)

//Возвращает новое множество, содержащее все элементы из обоих множеств, без дубликатов.
print("----------------------------------union-------------------------------------")
var unionPetAndFarm = setPetAnimal.union(setFarmAnimal)
print(unionPetAndFarm)
var unionPetAndExotic = setPetAnimal.union(setExoticAnimal)
print(unionPetAndExotic)
var unionFarmAndExotic = setFarmAnimal.union(setExoticAnimal)
print(unionFarmAndExotic)

//Возвращает новое множество, содержащее элементы из первого множества, которые отсутствуют во втором множестве.
print("-------------------------------subtracting----------------------------------------")
var subtractingPetAndFarm = setPetAnimal.subtracting(setFarmAnimal)
print(subtractingPetAndFarm)
var subtractingPetAndExotic = setPetAnimal.subtracting(setExoticAnimal)
print(subtractingPetAndExotic)
var subtractingFarmAndExotic = setFarmAnimal.subtracting(setExoticAnimal)
print(subtractingFarmAndExotic)
var subtractingFarmAndPet = setFarmAnimal.subtracting(setPetAnimal)
print(subtractingFarmAndPet)
var subtractingExoticAndPet = setExoticAnimal.subtracting(setPetAnimal)
print(subtractingExoticAndPet)
var subtractingExoticAndFarm = setExoticAnimal.subtracting(setFarmAnimal)
print(subtractingExoticAndFarm)
