//
//  ChoicePersonViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/16.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class ChoicePersonViewController: UIViewController {
    
    var request : Request = Request()
    
    var people : [String] = []
    
    @IBOutlet weak var choiceDescription: UILabel!
    
    @IBOutlet weak var groom: UIButton!
    @IBOutlet weak var bride: UIButton!
    @IBOutlet weak var groomMother: UIButton!
    @IBOutlet weak var brideMother: UIButton!
    @IBOutlet weak var groomFather: UIButton!
    @IBOutlet weak var brideFather: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDescriptionAndNextBtn()
        set(buttons: [groom, bride, groomMother, brideMother, groomFather, brideFather])
        animation(of: [groom, bride, groomMother, brideMother, groomFather, brideFather, nextBtn])
    }
    
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
    
    func animation(of buttons:[UIButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(animateButton(sender:)), for: .touchUpInside)
        }
    }
    
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
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        selectAndAdd(sender)
    }
    
    func selectAndAdd(_ button: UIButton) {
        guard let buttonTitle = button.currentTitle else { return }
        self.people.sort()
        self.people.sort(by: { $0.count < $1.count })
        //얘를 버튼을 클릭했을때 한번에 추가하도록 하고 여기서는 그냥 따로 변수 만들어서 추가하는 식으로 하자. 그리고! 가장 중요한건 추가할때 map? 또는 sorted? 메소드를 통해서 저기 위에 나와있는 순서대로 배열을 해서 다음 클릭시에 넘어가도록 하는게 가장 좋다고 생각한다.
        //굳이 sort 하지 말고 그냥 선택에 있어 제한(=선택되면 추가되고, 다시 선택되지 않으면 없어지고)을 두면 되지 않나?
        
        //일단 버튼 클릭했을때 6개로 제한되고 하나 선택되었던게 풀리면 그 element가 배열에서 없어지는 거 구현은 나중에
        self.people.append(buttonTitle)
        
        print(people)
        
        nextBtn.isEnabled = true
        nextBtn.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 0/255, green: 169/255, blue: 156/255, alpha: 1.0))
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
//        request.person = people
//        print(request.person)
        
        //설마 여기 request에 똑같은 함수를 통해서 할당을 하게 되면 같은 애로 착각을 하는건가? 전역변수라서? 그런데 메모리 상으로는 새롭게 생성이... 되는게 맞는 것 같진 않네... 그러면 request를 detailRequest와 함께 생성을 해서 그 놈을 채워넣는 식으로 진행을 해야 되겠네. 전역변수로 request를 채워넣어서는 안되겠네.
        self.request = makeDetailRequestInstance()
        user.myRequests.append(self.request)
        print("current myRequest is \(user.myRequests)")
        print("current requestNumber is \(user.myRequests.count)")
        //애초에 처음부터 여기서 user 인스턴스에 추가를 해볼 생각도 했지만 그러면 혹여 유저가 중간에 취소한다면 그것도 저장이 되어버리니 그냥 가장 마지막에 LaskCheckVC에서 완료를 눌렀을때 추가가 되도록 진행하면 될 것 같음.
    }
    //이 함수는 Request 인스턴스를 생성하는 동시에 person 프로퍼티의 값들을 가지고 있는 DetailRequest 인스턴스를 함께 생성 후 request 인스턴스 내부에 값을 저장.
    func makeDetailRequestInstance() -> Request {
        for (_, person) in self.people.enumerated() {
            let detailRequest = DetailRequest()
            detailRequest.person = person
            self.request.detailRequestList.append(detailRequest)
        }
        return request
    }
    
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToContainerVCSegue" {
            if let destination = segue.destination as? ContainerViewController, let detailRequestVC = destination.children.first as? DetailRequestTableViewController {
                destination.personChoices = self.people
                detailRequestVC.choicePersonVC = self
            }
        }
    }
    
    
}
