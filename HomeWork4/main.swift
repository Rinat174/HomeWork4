//
//  main.swift
//  TaskThree
//
//  Created by Сайфуллин Ринат on 05.06.2022.
//

import Foundation

enum ActionCars {

    case engineON
    case engineOFF
    case openWindows
    case closeWindows
    case loadLuggage  (volume: Int)
    case unloadLuggage (volume: Int)
    case atacheTrailer
    case unhokTrailer
    case sportModeOn
    case sportModeOff
    
}
enum BodyType {
    case sedan
    case hatchback
    case crossover
    case Suv
}

enum EngineType {
    case Gasoline
    case Diesel
}
    

enum TypeCar {
    case Passenger
    case Truck
}



protocol Car {
    
    var Mark: String {get set}
    var Year: Int   {get set}
    var openWindows: Bool {get set}
    var engineOn: Bool {get set}
    var typeCar: TypeCar  {get set}
    var engineType: EngineType {get set}
    


    func getEngineStatus () -> String
    func getWindowsStatus () -> String
    func actionCar (action: ActionCars)
  
    
    }



class SportCar : Car, CustomStringConvertible {


    var Mark: String
    var Year: Int
    var openWindows: Bool
    var engineOn: Bool
    var typeCar: TypeCar
    var engineType: EngineType
    var accelaration: Double
    var horsePower: Int
    var sportMode: Bool
    
    
     init () {
        Mark = ""
        Year = 0
        openWindows = false
        engineOn = false
        accelaration = 0
        accelaration  = 0.0
        typeCar = .Passenger
        horsePower = 0
        sportMode = false
        engineType = .Gasoline
    }
    
    var description: String {
        return  "Легковой автомобиль модель \(Mark) + количество л.с \(horsePower) разгон до 100 км \(accelaration)"
    }
    
    
     func actionCar(action: ActionCars) {
        switch action{
        case .engineON: self.engineOn = true
            print("Двигатель запущен")
        case .engineOFF: self.engineOn = false
            print("Двигатель остановлен ")
        case .openWindows: self.openWindows = true
            print("Окна открыты")
        case .closeWindows: self.openWindows = false
            print("Окна закрыты")
        case .sportModeOn: self.sportMode = true
            print ("Спорт режим включен")
        case .sportModeOff: self.sportMode = false
            print ("Спорт режим выключен ")
        default: break
    }
    }
    func getEngineStatus() -> String {
        if engineOn == true {
            
            return "Двигатель спорткара запущен"
            
        } else {
            return "Двигатель спорткара остановлен"
        }
    }
    func getWindowsStatus() -> String {
        if openWindows == true {
            return "Окна спорткара открыты"
        }
        else {
            print("Окна спорткара закрыты")
            return "Окна спорткара закрыты"
        }
    }
  

}
    
    


    
class TrunkCar: Car, CustomStringConvertible {
 

    
    var Mark: String
    var Year: Int
    var openWindows: Bool
    var engineOn: Bool
    var typeCar: TypeCar
    var engineType: EngineType
    var accelaration: Double
    var horsePower: Int
    var bagageVolume: Int
    var trailerOn: Bool
    
    init() {
        Year = 0
        trailerOn = false
        horsePower = 0
        Mark = ""
        openWindows = false
        engineOn = false
        typeCar = .Truck
        engineType = .Diesel
        accelaration = 0
        horsePower = 0
        bagageVolume = 0
    
        
        
        
    }
    
    func getBagadgeVolume () -> Int {
        return bagageVolume
        
    }
    
    
     func actionCar (action: ActionCars) {
        switch action{
        case .engineON: self.engineOn = true
            print("Двигатель запущен")
        case .engineOFF: self.engineOn = false
            print("Двигатель остановлен ")
        case .openWindows: self.openWindows = true
            print("Окна открыты")
        case .closeWindows: self.openWindows = false
            print("Окна закрыты")
        case .loadLuggage (let volume):
            print ("Идет погрузка грузовика \(volume) кг")
            self.bagageVolume = self.bagageVolume + volume
        case .unloadLuggage(let volume):
            print ("Выгрузили из багажника")
            self.bagageVolume = self.bagageVolume - volume
        case .atacheTrailer: self.trailerOn = true
            print ("Прицеп подцеплен")
        case .unhokTrailer: self.trailerOn = false
            print("Прицеп отцеплен")
        default: break
                        
        }
    }
    
    func getEngineStatus() -> String {
        if engineOn == true {
            return "Двигатель грузовика запущен"
            
        } else {
            return "Двигатель грузовика остановлен"
        }
    }
    func getWindowsStatus() -> String {
        if openWindows == true {
            return "Окна грузовика открыты"
        }
        else {
            return "Окна грузовика закрыты"
        }
    }
    
    var description: String {
        return ("Грузовой автобиль: \(Mark) год выпуска: \(Year) +  \(getEngineStatus())  \(getWindowsStatus())  погружено \(getBagadgeVolume()) кг. груза")
        
        
    }
}




 let audi  = SportCar()
audi.Mark = "Audi Q8"
audi.Year =  2018
audi.horsePower = 249
audi.accelaration = 6.9
audi.typeCar = .Passenger
audi.engineType = .Diesel

audi.actionCar(action: .engineON)
print (audi.description)
audi.actionCar(action: .engineOFF)
print (audi.description)


audi.actionCar(action: .openWindows)
print (audi.description)
audi.actionCar(action: .closeWindows)
print (audi.description)

let bmw =  SportCar()
bmw.Year = 2022
bmw.horsePower =  550
bmw.typeCar = .Passenger
bmw.engineType  = .Gasoline
bmw.accelaration = 3.2


bmw.actionCar(action: .sportModeOn)
print (bmw.description)
bmw.actionCar(action: .openWindows)

bmw.actionCar(action: .sportModeOff)

print (bmw.description)


let man  = TrunkCar()
man.Mark = "MAN"
man.Year =  1999


man.actionCar(action: .engineON)
print (bmw.description)
man.actionCar(action: .engineOFF)
print (bmw.description)


man.actionCar(action: .openWindows)

print (bmw.description)
man.actionCar(action: .closeWindows)
print (bmw.description)



man.actionCar(action: .loadLuggage(volume: 10000))

print (bmw.description)

man.actionCar(action: .unloadLuggage(volume: 5999))
print (bmw.description)

let volvo  = TrunkCar()
volvo.Mark = "Volvo"
volvo.engineType = .Diesel
volvo.actionCar(action: .engineON)

print (volvo.description)
volvo.actionCar(action: .atacheTrailer)

print (volvo.description)

volvo.actionCar(action: .unhokTrailer)


volvo.actionCar(action: .loadLuggage(volume: 5000))
print (volvo.description)

volvo.actionCar(action: .unloadLuggage(volume: 2000))
print (volvo.description)


