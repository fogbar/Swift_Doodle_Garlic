//
//  ContainerViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/26.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    //MARK:- IBOutlets
    //대상을 나타내는 SegmentedControl
    @IBOutlet weak var personSC: UISegmentedControl!
    //DetailRequestTVC를 감싸고 있는 EmbedView
    @IBOutlet weak var tableEmbedView: UIView!
    
    //MARK:- 내부적으로 사용하는 변수들
    //people을 전달받아서 count를 리턴하기 위해 존재하는 변수
    var personChoices : [String] = []
    //세부 견적 작성 흐름에서 사용되고 마지막에 user의 myRequests에 추가될 인스턴스. -> 얘는 무조건 있을거니 !써도 될듯
    var request : Request?
    
    //MARK:- ViewLifeCycles
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
    
    //MARK:- IBActions
    //PersonSC의 index 변화를 감지하여 DetailRequestTVC에다가 전달해주고 DetailRequestVC의 changeDataSet 함수를 실행시키는 액션
    @IBAction func changeSeg(_ sender: UISegmentedControl) {
        guard let request = request else {return}
        let selectedIndex = sender.selectedSegmentIndex
        guard let detailRequestVC = self.children.first as? DetailRequestTableViewController else {return}
        detailRequestVC.changeDataSet(selectedIndex)
        print(request.detailRequests[selectedIndex])
        
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

