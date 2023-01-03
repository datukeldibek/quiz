//
//  main.swift
//  quiz
//
//  Created by Jarae on 3/1/23.
//

//Критерии:
//Вы должны иметь 2 родительских(базовых) классов и по 2 наследующихся класса
//Каждый класс должен иметь не менее 3 переменных(1 из них - массив)
//Все свойства внутри классов должны быть закрытыми(приватными)
//Для массивов создать методы для добавления элемента, переопределения и удаления
//Вы должны иметь хотябы 1 закрытый метод внутри каждого класса
//Для каждого класса делать принт, говорящий о инициализации либо деинициализации элемента
//
//Когда закончите с подготовкой классов - создать по 3 объекта каждого из классов и пользуясь полиморфизмом и оператором is отобразить разные данные в консоль
//Когда перестаете работать с каким-то объектом - деинициализовать его
//Посчитать сколько переменных остались живыми(не были деинициализированы)

import Foundation
class Patient{
    var name: String
    var lastName: String
    var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
}
class Hospital{
    private var name: String
    private var isOpen: Bool
    private var area: Int
    private var patients = [Patient]()
    
    init(name: String, isOpen: Bool, area: Int) {
        self.name = name
        self.isOpen = isOpen
        self.area = area
    }
    func add(_ element: Patient){
        patients.append(element)
    }
    private func edit(_ element: Patient, _ change: String, _ changeTo: String){
        for i in patients{
            if i.name == change{
                i.name = changeTo
            }else if i.lastName == change{
                i.lastName = changeTo
            }
        }
    }
    func remove(_ element: Patient){
        for (index, item) in patients.enumerated(){
            if element.name == item.name && element.lastName == item.lastName && element.age == item.age{
                patients.remove(at: index)
            }
        }
    }
    deinit {
        print("деинициализирован")
    }
    
}
class Clinic: Hospital{
    private var schedule: String
    private var addres: String
    private var num: String
    private var array = [String]()
    
    init(schedule: String, addres: String, num: String, name: String, isOpen: Bool, area: Int) {
        self.schedule = schedule
        self.addres = addres
        self.num = num
        super.init(name: name, isOpen: isOpen, area: area)
    }
    func add(_ element: String){
        array.append(element)
    }
}
class BeautyClinic: Hospital{
    private var docNum: Int
    private var schedule: String
    private var vipPatientsNum: Int
    private var array = [String]()
    
    init(docNum: Int, schedule: String, vipPatientsNum: Int, name: String, isOpen: Bool, area: Int) {
        self.schedule = schedule
        self.docNum = docNum
        self.vipPatientsNum = vipPatientsNum
        super.init(name: name, isOpen: isOpen, area: area)
    }
    func add(_ element: String){
        array.append(element)
    }
}

var p1 = Patient(name: "name1", lastName: "ln1", age: 12)
var p2 = Patient(name: "name2", lastName: "ln2", age: 1)
var p3 = Patient(name: "name3", lastName: "ln3", age: 2)

var hos1 = Hospital(name: "ala-too", isOpen: true, area: 100)
var hos2 = Hospital(name: "ala-too2", isOpen: false, area: 20)

var clinic1 = Clinic(schedule: "12", addres: "osh", num: "+000", name: "name", isOpen: false, area: 10)
var bClinic = BeautyClinic(docNum: 12, schedule: "24", vipPatientsNum: 10, name: "", isOpen: false, area: 12)

var array : [Hospital] = [hos1, hos2, clinic1]
for i in array{
    if i is Clinic{
        print("clinic")
    }else if i is BeautyClinic{
        print("beauty clinic")
    }else{
        print("hospital")
    }
    
}
