//
//  ContainerViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/26.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var personSC: UISegmentedControl!
    var personChoices : [String] = [] // = request.person
    
    @IBOutlet weak var tableEmbedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personSC.removeAllSegments()
        for person in personChoices {
            personSC.insertSegment(withTitle: person, at: personChoices.count, animated: true)
        }
        personSC.selectedSegmentIndex = 0
        guard let navigationTitle = personSC.titleForSegment(at: 0) else {return}
        navigationItem.title = navigationTitle
    }
    
    
    @IBAction func changeSeg(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        guard let tableVC = self.children.first as? DetailRequestTableViewController else {return}
        tableVC.changeDataSet(selectedIndex)
        print(selectedIndex, "current requestNumber is \(user.myRequests) in ContainerVC")
        print(selectedIndex, "current requestNumber is \(user.myRequests.count)")
        
        self.navigationItem.title = personSC.titleForSegment(at: selectedIndex)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
