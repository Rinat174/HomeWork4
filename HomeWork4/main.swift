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



class Car {
    
    var Mark: String
    var Year: Int
    var openWindows: Bool
    var engineOn: Bool
    var typeCar: TypeCar
    var engineType: EngineType
    
    init ()  {
        self.Mark = ""
        self.Year = 0
        self.typeCar = .Passenger
        self.engineType = .Gasoline
        self.engineOn = false
        self.openWindows = false
    }
    
    
    func getEngineStatus () -> String
    {
        if (engineOn == true) {
            return "Двигатель запущен"
            
        }
        else{
            return "Двигатель остановлен"
        }
    }
    func getWindowsStatus () -> String {
        if openWindows == true {
            return "Окна открыты"
            
        } else {
            return "Окна закрыты"
        }
        
    }
    func actionCar (action: ActionCars) {
         
    }
    
     func toString () {
        print ("Марка \(Mark) Год выпуска \(Year) тип автомобиля \(typeCar)  тип двигателя \(engineType)" )
    }
    }



class SportCar : Car {
  
   
    var accelaration: Double
    var horsePower: Int
    var sportMode: Bool
    
    
    override init () {
        accelaration  = 0.0
        horsePower = 0
        sportMode = false
    }
    override func actionCar(action: ActionCars) {
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
    
    override func toString () {
    
        print ("Легковой автомобиль модель \(Mark) + количество л.с \(horsePower) разгон до 100 км \(accelaration)")
        
    }

}
    
    


    
class TrunkCar: Car {

    var bagageVolume: Int
    var trailerOn: Bool
    
   
    override init () {
        bagageVolume = 0
        trailerOn = false
    }
    
    func getBagadgeVolume () -> Int {
        return bagageVolume
        
    }
    
    
    override func actionCar (action: ActionCars) {
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
    override func toString (){
        print ("Грузовой автобиль: \(Mark) год выпуска: \(Year) +  \(getEngineStatus())  \(getWindowsStatus())  погружено \(getBagadgeVolume()) кг. груза")
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
audi.toString()
audi.actionCar(action: .engineOFF)
audi.toString()


audi.actionCar(action: .openWindows)
audi.toString()
audi.actionCar(action: .closeWindows)
audi.toString()

let bmw =  SportCar()
bmw.Year = 2022
bmw.horsePower =  550
bmw.typeCar = .Passenger
bmw.engineType  = .Gasoline
bmw.accelaration = 3.2


bmw.actionCar(action: .sportModeOn)
bmw.toString()
bmw.actionCar(action: .openWindows)

bmw.actionCar(action: .sportModeOff)

bmw.toString()


let man  = TrunkCar()
man.Mark = "MAN"
man.Year =  1999


man.actionCar(action: .engineON)
man.toString()
man.actionCar(action: .engineOFF)
man.toString()


man.actionCar(action: .openWindows)

man.toString()
man.actionCar(action: .closeWindows)
man.toString()



man.actionCar(action: .loadLuggage(volume: 10000))

man.toString()

man.actionCar(action: .unloadLuggage(volume: 5999))
man.toString()

let volvo  = TrunkCar()
volvo.Mark = "Volvo"
volvo.engineType = .Diesel
volvo.actionCar(action: .engineON)

volvo.toString()
volvo.actionCar(action: .atacheTrailer)

volvo.toString()

volvo.actionCar(action: .unhokTrailer)


volvo.actionCar(action: .loadLuggage(volume: 5000))
volvo.toString()

volvo.actionCar(action: .unloadLuggage(volume: 2000))
volvo.toString()


