//
//  ChoicePersonViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/16.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class ChoicePersonViewController: UIViewController {
    
    //MARK:- IBOutlets
    //설명 Label
    @IBOutlet weak var choiceDescription: UILabel!
    //선택지 버튼들
    @IBOutlet weak var groom: UIButton!
    @IBOutlet weak var bride: UIButton!
    @IBOutlet weak var groomMother: UIButton!
    @IBOutlet weak var brideMother: UIButton!
    @IBOutlet weak var groomFather: UIButton!
    @IBOutlet weak var brideFather: UIButton!
    //"다음" 버튼
    @IBOutlet weak var nextBtn: UIButton!
    
    //내부적으로 쓰이는 변수
    //ContainerVC의 personSC로 넘길 변수
    var people : [String] = []
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDescriptionAndNextBtn()
        set(buttons: [groom, bride, groomMother, brideMother, groomFather, brideFather])
        animation(of: [groom, bride, groomMother, brideMother, groomFather, brideFather, nextBtn])
    }
    
    //MARK:- Function List
    //설명 설명 label과 다음 버튼 세팅 함수
    func setDescriptionAndNextBtn() {
        choiceDescription.text = "*중복선택을 통해 다수의 견적을 한 번에 작성할 수 있습니다.\n\n(중복선택을 하지 않을때와 가격 차이가 있을 수 있습니다.)"
        choiceDescription.textColor = UIColor.init(cgColor: CGColor(srgbRed: 94/255, green: 94/255, blue: 94/255, alpha: 1.0))
        choiceDescription.numberOfLines = 0
        choiceDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        //이거 여기 버튼에는 대체 왜? 그림자가 먹혀지지 않는건지 공부하기
        nextBtn.layer.shadowColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0).cgColor
        nextBtn.layer.shadowRadius = 9
        nextBtn.layer.shadowOpacity = 0.4
        nextBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 214/255, green: 213/255, blue: 213/255, alpha: 1.0))
        nextBtn.setTitle("다음", for: .normal)
        nextBtn.setTitleColor(UIColor.white, for: .normal)
        
        nextBtn.layer.cornerRadius = 7.0
        nextBtn.layer.borderWidth = 1.0
        nextBtn.layer.borderColor = CGColor(srgbRed: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
    }
    //선택지 버튼들 세팅을 위한 함수
    func set(buttons:[UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 4.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = CGColor(srgbRed: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
        }
        groom.setTitle(Person.groom.rawValue, for: .normal)
        bride.setTitle(Person.bride.rawValue, for: .normal)
        groomMother.setTitle(Person.groomMother.rawValue, for: .normal)
        brideMother.setTitle(Person.brideMother.rawValue, for: .normal)
        groomFather.setTitle(Person.groomFather.rawValue, for: .normal)
        brideFather.setTitle(Person.brideFather.rawValue, for: .normal)
    }
    //선택지 버튼 들이 선택될떄 적용될 애니메이션
    func animation(of buttons:[UIButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(animateButton(sender:)), for: .touchUpInside)
        }
    }
    //buttom들에 들어갈 함수 구현
    @objc fileprivate func animateButton(sender:UIButton) {
        animateView(sender)
    }
    
    fileprivate func animateView(_ viewToAnimate:UIView) { //animate 좀 더 공부해보기
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    // Action 함수들중 buttonClicked 액션에서 사용될 함수.
    // 버튼을 클릭하면 그 버튼의 currentTitle이 people 배열에 append 된다. 그리고 동시에 정렬된다.
    // 버튼 클릭시 대상이 이미 선택되어 있었다면 people 배열에서 없애고, 선택이 되어있지 않다면 people 배열에 추가함
    // nextBtn도 대상이 한명 이상 선택되어 있다면 활성화 되고 0명이면 활성화되지 않도록 구현
    func selectAndAdd(_ button: UIButton) {
        guard let buttonTitle = button.currentTitle else { return }
        self.people.sort()
        self.people.sort(by: { $0.count < $1.count })
        //추가할때 map? 또는 sorted? 메소드를 통해서 저기 위에 나와있는 순서대로 배열을 해서 다음 클릭시에 넘어가도록 하는게 가장 좋다고 생각한다.
        
        if self.people.contains(buttonTitle) {
            self.people = self.people.filter { $0 != buttonTitle }
        } else {
            self.people.append(buttonTitle)
        }
        
        print(people)
        
        if self.people.count == 0 {
            nextBtn.isEnabled = false
            nextBtn.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 214/255, green: 213/255, blue: 213/255, alpha: 1.0))
        } else {
            nextBtn.isEnabled = true
            nextBtn.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 0/255, green: 169/255, blue: 156/255, alpha: 1.0))
        }
    }
    
    //MARK:- IBActions
    //선택지 버튼들 클릭하면 작동되는 액션
    @IBAction func buttonClicked(_ sender: UIButton) {
        selectAndAdd(sender)
    }
    
    //다음 버튼 클릭시에 동작하는 액션
    @IBAction func nextBtnClicked(_ sender: Any) {
        //짜피 위 selectAndAdd 함수에서 count에 따라 NextBtn.isEnabled를 분기시키니 굳이 if로 나눌필요 없이 그냥 동작만 하도록 해도 될듯하다.
//        if self.people.count > 0 {
//
//        }
        //이건 전역변수를 없애고나면 더 이상 필요없어질 데이터.
        detailRequest.person = self.people[0]
        //아래 map 메소드를 통해서 request.detailRequestPerPerson에다가 person 프로퍼티에다가 person을 각각 넣어놓은 채로 people의 갯수만큼 detailRequest를 생성시켜서 넣어놓는다.
        request.detailRequestPerPerson = people.map { person in
            var detailRequest = DetailRequest()
            detailRequest.person = person
            return detailRequest
        }
    }
    
    //navigationLeftItem에 있는 ">" 취소하기 버튼 클릭시 나오는 액션.
    @IBAction func cancelRequest(_ sender: Any) {
        let alert = UIAlertController(title: "알림", message: "정말 나가시겠습니까?\n작성중인 내용은 저장되지 않습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "나가기", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in
            
        })
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    // 아마 내부적으로 detailRequest를 만들어서 전달하는 식으로 될 것 같음.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToContainerVCSegue" {
            if let destination = segue.destination as? ContainerViewController {
                destination.personChoices = self.people
            }
        }
    }
    
    
}
