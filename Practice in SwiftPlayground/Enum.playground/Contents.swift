import UIKit
//
//class Point {
//    var tempX : Int = 1
//    var x: Int {
//        get {
//            return tempX
//        }
//        set(newValue) {
//            tempX = newValue * 2
//        }
//    }
//}
//
//var p: Point = Point()
//p.x
//print(p.x)
//
//p.x = 12
//print(p.x)
//
//
//
//struct Point {
//    var store : Int = 1
//
//    var compute: Int {
//        mutating get {
//            store += 4
//            return store
//        }
//        set {
//            store = newValue * 3
//        }
//    }
//}
//
//var point = Point()
//point.compute
//print(point.compute)
//print(point.compute)
//
//point.compute = 50
//print(point.compute)
//
//
//class StepCounter {
//    var totalSteps: Int = 0 {
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps)")
//        }
//        didSet {
//            if totalSteps < oldValue  {
//                print("Added \(totalSteps - oldValue) steps")
//            }
//        }
//    }
//}
//let stepCounter = StepCounter()
//stepCounter.totalSteps = 200
//print(stepCounter.totalSteps)
//// About to set totalSteps to 200
//// Added 200 steps
//stepCounter.totalSteps = 360
//print(stepCounter.totalSteps)
//// About to set totalSteps to 360
//// Added 160 steps
//stepCounter.totalSteps = 896
//print(stepCounter.totalSteps)
//// About to set totalSteps to 896
//// Added 536 steps
//
//
//enum Direction {
//    case east
//    case west
//    case north
//    case south
//}
//
//
//func getDirectionLabel(direction: Direction) -> String {
//    switch direction {
//    case .east:
//        return "동쪽"
//    case .west:
//        return "서쪽"
//    case .north:
//        return "북쪽"
//    case .south:
//        return "남쪽"
//    }
//}



typealias Parameters = (type: String, time: Int, unit:String)

enum Vehicle {
    case bicycle(Parameters) //typealias 사용.
    case car(String, Int, String) //변수명 없이 그냥 자료형만 나열해도 됨.
    case walk(type: String, time: Int, unit:String) //가장 기본형.
    case subway(type: String, time: Int, unit:Unit) // Unit enum을 하나 만들어서 해보장.

    enum Unit {
        case hour
        case minute

        func select() -> String {
            switch self {
            case .hour:
                return "시간"
            case .minute:
                return "분"
            }
        }
    }
}

func timeToGoHome(vehicle: Vehicle) -> String {
    switch vehicle {
    case let .bicycle(par): //모든 연관값을 바인딩할려면 let을 case 뒤에다가 넣으면 된다.
        return "나는 \(par.type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(par.time))\(par.unit)정도 걸려"
    case let .car(type, time, unit):
        return "나는 \(type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(time))\(unit)정도 걸려"
    case .walk(let type, let time, _): //--> 만약 연관값 중 필요없는 값이 있다면 wildcard pattern을 통해 생략하면 됨.
        return "나는 \(type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(time))정도 걸려"
    case .subway(let type, let time, let unit):
        switch unit {
        case .hour:
            return "나는 \(type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(time))\(unit.select())정도 걸려"
        case .minute:
            return "나는 \(type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(time))\(unit.select())정도 걸려"
        }
        //return "나는 \(type)를 타고 가지렁 헤헤헿ㅎ헿 시간은 약 \(String(time))\(unit)정도 걸려"
    }
}

//let bicycleUnit = Unit.select(Unit.hour)
let bicycle = Vehicle.bicycle((type: "자전거", time: 1, unit: "시간"))
timeToGoHome(vehicle: bicycle)

//let car = Vehicle.car(type: <#T##String#>, time: <#T##Int#>, unit: <#T##String#>)

let subway = Vehicle.subway(type: "지하철", time: 50, unit: .minute)
timeToGoHome(vehicle: subway)

/*
import UIKit

struct A {
    var a : String = ""
    var bList : [B] = []
}

struct B {
    var b : String = ""
    var cList : [C] = []
}

struct C {
    // d 변수는 1번 VC에서 값이 입력됨
    var d : String = ""
    // e 변수는 2번 VC에서 값이 입력됨
    var e : String = ""
}

var firstInstance = A()
var secondInstance = B()
var thirdInstance = C()
*/
