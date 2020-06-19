//
//  RedButtonViewController.swift
//  PdfTest
//
//  Created by 김동준 on 2020/03/11.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class RedButtonViewController: UIViewController {
    
    @IBOutlet var cityButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "redMagazine", sender: sender)
    }
    
    
    @IBAction func handleSelection(_ sender: UIButton) {
        cityButtons.forEach{ (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    enum City : String {
        case boston = "Boston"
        case losAngels = "Los Angels"
        case sanfransisco = "San Fransisco"
        case newYorkCity = "New York City"
        
        var title: Void {
            switch self {
            case .boston:
                print("Boston")
            case .losAngels:
                print("Los Angels")
            case .sanfransisco:
                print("San Fransisco")
            case .newYorkCity:
                print("New York City")
            }
        }
    }
    
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let city = City(rawValue: title) else {
            return
        }
        city.title
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "redMagazine" as String {
            if let destination = segue.destination as? ViewController, let targetURL = Bundle.main.url(forResource: "RedMagazine", withExtension: "pdf")  {
                destination.targetURL = targetURL
                destination.modalPresentationStyle = .fullScreen
            }
        }
    }
    
    
}
