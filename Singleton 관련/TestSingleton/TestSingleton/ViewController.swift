//
//  ViewController.swift
//  TestSingleton
//
//  Created by garlic on 2020/06/04.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class Singleton {
    static let shared = Singleton()
    private init() {}
}

class Printer {
    static let shared = Printer()
    private init() {}

    func printDoc(_ doc: String) {
        print(doc)
    }
}

struct TaylorFan {
    static var sharedInstance = TaylorFan()

    var name : String
    var age : Int

    init() {
        self.name = ""
        self.age = 0
    }
}

class ViewController: UIViewController {
    
    var fan = TaylorFan.sharedInstance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fan.name = "Brian"
        fan.age = 19
        print(fan)

        Printer.shared.printDoc("싱글톤 예제")

        let someObject1 = NormalClass()
        let someObject4 = someObject1
        someObject1.x = 10
        someObject1.x = 50
        someObject4.x = 60
        someObject1.x = 80
        Printer.shared.printDoc(String(someObject1.x))
        Printer.shared.printDoc(String(someObject4.x))

        let someObject2 = NormalClass()
        someObject2.x = 20
        Printer.shared.printDoc(String(someObject2.x))

        let someObject3 = NormalClass()
        someObject3.x = 40
        Printer.shared.printDoc(String(someObject3.x))

    }

    class NormalClass {
        var x = 0
    }

    
    

}

