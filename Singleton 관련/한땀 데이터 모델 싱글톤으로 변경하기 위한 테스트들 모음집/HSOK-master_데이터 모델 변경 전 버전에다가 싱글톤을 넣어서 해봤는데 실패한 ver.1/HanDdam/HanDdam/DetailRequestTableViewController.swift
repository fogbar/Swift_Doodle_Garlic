//
//  DetailRequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/26.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class DetailRequestTableViewController: UITableViewController {
    
    var choicePersonVC : ChoicePersonViewController?
    
    var currentButtonText = "다음"
    var isButtonSelected = true
    let buttonTagList : [Int] = [201, 202, 203, 204, 205, 206, 207, 208]
    
    var imagePicker = UIImagePickerController()
    
    var currentPerson : String = ""
    
    //이 두 놈은 choicePersonVC으로 컨트롤되나 안되나에 따라 달라짐
    var currentRequestInstance:Request?
    var currentDetailRequestInstance : DetailRequest?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nextBtn: UIButton!
    //MARK: infoViews
    @IBOutlet var popOverWayInfo: UIView!
    @IBAction func closePopOverWayInfoView(_ sender: UIButton) {
        popOverWayInfo.removeFromSuperview()
        self.tableView.isUserInteractionEnabled = true
        //self.view.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
        //        self.tableView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
    }

    @IBOutlet var popOverFabricInfoView: UIView!
    @IBAction func closePopOverFabricInfoView(_ sender: UIButton) {
        popOverFabricInfoView.removeFromSuperview()
        self.tableView.isUserInteractionEnabled = true
    }
    
    @IBOutlet var popOverSeasonInfoView: UIView!
    @IBAction func closePopOverSeasonInfoView(_ sender: UIButton) {
        popOverSeasonInfoView.removeFromSuperview()
        self.tableView.isUserInteractionEnabled = true
        //self.view.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
        //self.tableView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
    }
    
    @IBOutlet var popOverImageInfoView: UIView!
    @IBAction func closePopOverImageInfoView(_ sender: UIButton) {
        popOverImageInfoView.removeFromSuperview()
        self.tableView.isUserInteractionEnabled = true
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeDataSet(0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker.delegate = self
        
        self.tableView.separatorColor = UIColor.clear
        
        nextBtn.addTarget(self, action: #selector(goToLastCheckVC(_:)), for: .touchUpInside)
        
        setting(infoViews: [popOverWayInfo, popOverSeasonInfoView, popOverFabricInfoView, popOverImageInfoView])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        
        if containerVC.personSC.numberOfSegments == 1 {
            self.currentButtonText = "작성 완료"
            nextBtn.setTitle(currentButtonText, for: .normal)
        } else {
            self.currentButtonText = "다음"
            nextBtn.setTitle(currentButtonText, for: .normal)
        }
    }
    
    @objc func goToLastCheckVC(_ sender: UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        let lastIndex = containerVC.personChoices.count - 1
        
        if containerVC.personSC.numberOfSegments == 1 {
            performSegue(withIdentifier: "LastCheckSegue", sender: self)
        } else {
            if self.currentButtonText == "작성 완료" {
                performSegue(withIdentifier: "LastCheckSegue", sender: self)
            }
            else {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.tableView.reloadData()
                
                containerVC.personSC.selectedSegmentIndex += 1
                
                if containerVC.personSC.selectedSegmentIndex == lastIndex {
                    self.currentButtonText = "작성 완료"
                    sender.setTitle(currentButtonText, for: .normal)
                }
                
                //selected된 버튼들 모두 풀기
                for tag in buttonTagList {
                    guard let button = self.tableView.viewWithTag(tag) as? UIButton else {return}
                    button.isSelected = !isButtonSelected
                }
                //Image default로 돌려놓기
                let imageIndexpath = IndexPath(row: 0, section: 4)
                guard let itemCell = self.tableView.cellForRow(at: imageIndexpath) as? ImageCell else {return}
                itemCell.hanbokImage.image = UIImage(named: "detailRequestDefaultImage")
                //ageSlider 원상복구 -->여기서 왜 ageSlider만 복구가 안될까... 혹시 Cell Custom시에 awakeFromNib과 관련이 있는 걸까?
                let ageIndexpath = IndexPath(row: 0, section: 2)
                guard let ageCell = self.tableView.cellForRow(at: ageIndexpath) as? AgeCell else {return}
                ageCell.ageSlider.value = 0.0
                //selected된 버튼 풀기부터 ageSlider까지 모두 이니셜라이저 만들어서 초기값 할당한다음에 그냥 그때로 돌아가게 하면 안되나? 이렇게 일일이 다 바꿔야되는건가?
                
                //self.tableView.reloadData() --> 이건 일단 keep!
            }
        }
    }
    
    func changeDataSet(_ segNum:Int) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        currentPerson = containerVC.personChoices[segNum]
        //requestNum - 1을 하는게 맞음. 그러면 이 문제가 아니라는 소리네.
//        self.currentDetailRequestInstance = user.myRequests[requestNum - 1].detailRequestList[segNum]
        self.currentRequestInstance = self.choicePersonVC?.request
        self.currentDetailRequestInstance = self.currentRequestInstance?.detailRequestList[segNum]
        //생성된 후니까 requestNum - 1로 가야함
        print("current requestNumber is \(user.myRequests) in DetailRequestTVC")
        print("current requestNumber is \(user.myRequests.count)")
        
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        self.tableView.reloadData()
    }
    
    func setting(infoViews : [UIView]) {
        for infoView in infoViews {
            infoView.layer.cornerRadius = 4.0
            infoView.layer.borderWidth = 1.0
            infoView.backgroundColor = UIColor.white
            infoView.layer.borderColor = CGColor(srgbRed: 121/255, green: 121/255, blue: 121/255, alpha: 1.0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //대체 왜 전부다 nil이 나오는거지? 값이 제대로 들어가지 않고???? 아오..
    @IBAction func touchElementsBtn(_ sender: UIButton) {
        guard let currentDetailRequestInstance = self.currentDetailRequestInstance else {return}
        switch sender.tag {
        case 201:
            //여기에서 nil이 떠버려.
            currentDetailRequestInstance.makingType = MakingType.make.rawValue
            print(currentDetailRequestInstance.makingType)
        case 202:
            currentDetailRequestInstance.makingType = MakingType.borrow.rawValue
            print(currentDetailRequestInstance.makingType)
        case 203:
            currentDetailRequestInstance.fabric = Fabric.silk.rawValue
            print(currentDetailRequestInstance.fabric)
        case 204:
            currentDetailRequestInstance.fabric = Fabric.waterSilk.rawValue
            print(currentDetailRequestInstance.fabric)
        case 205:
            currentDetailRequestInstance.season = Season.spring.rawValue
            print(currentDetailRequestInstance.season)
        case 206:
            currentDetailRequestInstance.season = Season.summer.rawValue
            print(currentDetailRequestInstance.season)
        case 207:
            currentDetailRequestInstance.season = Season.fall.rawValue
            print(currentDetailRequestInstance.season)
        case 208:
            currentDetailRequestInstance.season = Season.winter.rawValue
            print(currentDetailRequestInstance.season)
        default:
            print("unknown")
            return
        }
    }
    
    //image는 받아서 어떻게 저장시켜야할지 생각해보기
    
    @IBAction func uploadImage(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 4)
        
        guard let itemCell = tableView.cellForRow(at: indexPath) as? ImageCell else {return}
        
        let actionSheet = UIAlertController(title: "사진 선택", message: "원하는 디자인의 한복사진 선택해서 올리기", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "사장님이 추천해주세요", style: .default, handler: {(action : UIAlertAction) in
            
            itemCell.hanbokImage.image = UIImage(named: "recommendedByChairman")
            self.currentDetailRequestInstance?.detailImage = UIImage(named: "recommendedByChairman")
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "라이브러리에서 선택", style: .default, handler: {(action : UIAlertAction) in
            
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WayCell") as? WayCell else {return defaultCell}
            
            cell.makeHanbok.setTitle(MakingType.make.rawValue, for: .normal)
            cell.borrowHanbok.setTitle(MakingType.borrow.rawValue, for: .normal)
            //            cell.makeHanbok.isExclusiveTouch = true
            //            cell.borrowHanbok.isExclusiveTouch = true
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FabricCell") as? FabricCell else {return defaultCell}
            
            cell.silkBtn.setTitle(Fabric.silk.rawValue, for: .normal)
            cell.waterSilkBtn.setTitle(Fabric.waterSilk.rawValue, for: .normal)
            //            cell.silkBtn.isExclusiveTouch = true
            //            cell.waterSilkBtn.isExclusiveTouch = true
            
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AgeCell") as? AgeCell else {return defaultCell}
            
            //self.currentDetailRequestInstance.age = cell.ageValue
            //print(currentDetailRequestInstance.age)
            
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell") as? SeasonCell else {return defaultCell}
            
            cell.springBtn.setTitle(Season.spring.rawValue, for: .normal)
            cell.summerBtn.setTitle(Season.summer.rawValue, for: .normal)
            cell.fallBtn.setTitle(Season.fall.rawValue, for: .normal)
            cell.winterBtn.setTitle(Season.winter.rawValue, for: .normal)
            
            //            cell.springBtn.isExclusiveTouch = true
            //            cell.summerBtn.isExclusiveTouch = true
            //            cell.fallBtn.isExclusiveTouch = true
            //            cell.winterBtn.isExclusiveTouch = true
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell else {return defaultCell}
            
            
            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var wayHeight : CGFloat
        wayHeight = 100
        //wayHeight의 구체적 높이 할당
        var ageHeight : CGFloat
        ageHeight = 100
        //ageHeight의 구체적 높이 할당
        var seasonHeight : CGFloat
        seasonHeight = 90
        //seasonHeight의 구체적 높이 할당
        var imageHeight : CGFloat
        imageHeight = 300
        //ImageHight의 구체적 높이 할당
        var fabricHeight : CGFloat
        fabricHeight = 100
        //fabircHeight의 구체적 높이 할당
        
        //swtich 문으로 tableView의 section or row에 따라 각 height 할당하면 될듯 return은 각 height
        switch indexPath.section {
        case 0:
            return wayHeight
        case 1:
            return fabricHeight
        case 2:
            return ageHeight
        case 3:
            return seasonHeight
        case 4:
            return imageHeight
        default:
            return CGFloat(140)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 50
        return height
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 40
        return height
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footerView : UIView?
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        footerView?.backgroundColor = UIColor.white
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView?
        headerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
        headerView?.backgroundColor = UIColor.white
        
        let title = UILabel(frame: CGRect(x:30, y:10, width:300, height:30)) //이거 정확한 값 알아내기
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = UIColor.black
        
        let showWayInfoBtn = UIButton(type: UIButton.ButtonType.custom)
        showWayInfoBtn.setImage(UIImage(named: "showInfoBtnImage"), for: .normal)
        showWayInfoBtn.backgroundColor = .white
        showWayInfoBtn.frame = CGRect(x: 300, y:10, width:30, height:30)
        showWayInfoBtn.addTarget(self, action: #selector(showWayInfo(sender:)), for: .touchUpInside)
        
        let showFabricInfoBtn = UIButton(type: UIButton.ButtonType.custom)
        showFabricInfoBtn.setImage(UIImage(named: "showInfoBtnImage"), for: .normal)
        showFabricInfoBtn.backgroundColor = .white
        showFabricInfoBtn.frame = CGRect(x: 250, y:10, width:30, height:30)
        showFabricInfoBtn.addTarget(self, action: #selector(showFabricInfo(sender:)), for: .touchUpInside)
        
        let showSeasonInfoBtn = UIButton(type: UIButton.ButtonType.custom)
        showSeasonInfoBtn.setImage(UIImage(named: "showInfoBtnImage"), for: .normal)
        showSeasonInfoBtn.backgroundColor = .white
        showSeasonInfoBtn.frame = CGRect(x: 220, y: 10, width: 30, height: 30)
        showSeasonInfoBtn.addTarget(self, action: #selector(showSeasonInfo(sender:)), for: .touchUpInside)
        
        let showImageInfoBtn = UIButton(type: UIButton.ButtonType.custom)
        showImageInfoBtn.setImage(UIImage(named: "showInfoBtnImage"), for: .normal)
        showImageInfoBtn.backgroundColor = .white
        showImageInfoBtn.frame = CGRect(x: 260, y: 10, width: 30, height: 30)
        showImageInfoBtn.addTarget(self, action: #selector(showImageInfo(sender:)), for: .touchUpInside)
        
        
        
        if section == 0 {
            title.text = "대여와 맞춤 중 무엇으로 하시겠어요?"
            headerView?.addSubview(showWayInfoBtn)
        }
            
        else if section == 1 {
            title.text = "원하시는 재질을 선택해주세요"
            headerView?.addSubview(showFabricInfoBtn)
        }
            
        else if section == 2 {
            title.text = "나이를 선택해주세요."
        }
            
        else if section == 3 {
            title.text = "어느 계절에 입으실건가요?"
            headerView?.addSubview(showSeasonInfoBtn)
        }
            
        else {
            title.text = "원하는 한복 사진을 첨부해주세요."
            headerView?.addSubview(showImageInfoBtn)
        }
        
        headerView?.addSubview(title)
        return headerView
        
    }
    
    @objc fileprivate func showWayInfo(sender:UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        containerVC.view.addSubview(popOverWayInfo)
        popOverWayInfo.center = containerVC.view.center
        animateView(sender)
        self.tableView.isUserInteractionEnabled = false
        //self.view.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 122/255, green: 122/255, blue: 122/255, alpha: 1.0))
        //self.tableView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 122/255, green: 122/255, blue: 122/255, alpha: 1.0))
    }
    
    @objc fileprivate func showFabricInfo(sender:UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        containerVC.view.addSubview(popOverFabricInfoView)
        popOverFabricInfoView.center = containerVC.view.center
        animateView(sender)
        self.tableView.isUserInteractionEnabled = false
    }
    
    
    @objc fileprivate func showSeasonInfo(sender:UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        containerVC.view.addSubview(popOverSeasonInfoView)
        popOverSeasonInfoView.center = containerVC.view.center
        self.tableView.isUserInteractionEnabled = false
        animateView(sender)
        //self.view.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 122/255, green: 122/255, blue: 122/255, alpha: 1.0))
        //self.tableView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 122/255, green: 122/255, blue: 122/255, alpha: 1.0))
    }
    
    @objc fileprivate func showImageInfo(sender:UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        containerVC.view.addSubview(popOverImageInfoView)
        popOverImageInfoView.center = containerVC.view.center
        self.tableView.isUserInteractionEnabled = false
        animateView(sender)
    }
    
    
    fileprivate func animateView(_ viewToAnimate:UIView) { //animate 좀 더 공부해보기
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LastCheckView" {
            if let destination = segue.destination as? LastCheckRequestTableViewController {
                destination.currentRequest = self.currentRequestInstance
            }
        }
    }
    
}

extension DetailRequestTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            let indexPath = IndexPath(row: 0, section: 4)
            guard let itemCell = tableView.cellForRow(at: indexPath) as? ImageCell else {return}
            itemCell.hanbokImage.image = image
            self.currentDetailRequestInstance?.detailImage = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
