//
//  DetailRequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/03/26.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class DetailRequestTableViewController: UITableViewController {
    
    //MARK:- 내부적으로 사용되는 변수들
    var currentButtonText = "다음"
    var isButtonSelected = true
    //Button에다가 tag를 달아가지고 굳이 Outlet 연결하지 않고 tag로 접근하기 위해 생성
    let buttonTagList : [Int] = [201, 202, 203, 204, 205, 206, 207, 208]
    //사진 고르도록 하는 picker
    var imagePicker = UIImagePickerController()
    //현재 선택되어있는 ContainerVC에 있는 Segment Index
    var selectedIndex : Int = 0
    
    //MARK:- IBOutlets
    //다음으로 넘어가는 버튼
    @IBOutlet weak var nextBtn: UIButton!
    
    //! 버튼 눌렀을때 뜨는 뷰. -> 세부 견적 작성시에 참고할만한 정보들을 알려주는 뷰
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
    
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        imagePicker.delegate = self
        
        self.tableView.separatorColor = UIColor.clear
        
        nextBtn.addTarget(self, action: #selector(goToLastCheckVC(_:)), for: .touchUpInside)
        
        setting(infoViews: [popOverWayInfo, popOverSeasonInfoView, popOverFabricInfoView, popOverImageInfoView])
        
                changeDataSet(0)
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
        changeDataSet(0)
        
    }
    //nextBtn이 클릭되면 실행될 함수. 다음 버튼으로 넘어가도록 구현되어있음. (이제 index로 바꾼후에 함수로 따로 빼놓고 SegmentedControl이나 다음 버튼 클릭했을때 똑같이 동작하도록 구현하면 될듯. 참고로 index가 +될때 외에도 -될때도 염두를 해서 함수를 작성해야함.
    @objc func goToLastCheckVC(_ sender: UIButton) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        guard let request = containerVC.request else {return}
        //이동한 segment index - 직전 segment index 를 해서 얼만큼 이동했는지를 구해야 함.
        //guard let request = containerVC.request else {return}
        
        let lastIndex = containerVC.personChoices.count - 1
        
        if containerVC.personSC.numberOfSegments == 1 {
            performSegue(withIdentifier: "LastCheckSegue", sender: self)
        } else {
            if self.currentButtonText == "다음" {
                
                //                if currentDetailRequest?.makingType == "" {
                //                    currentDetailRequest?.makingType = request.detailRequests[containerVC.personSC.selectedSegmentIndex - 1].makingType
                //                 }
                
            }
            if self.currentButtonText == "작성 완료" {
                /* 이미 request에 추가되어있을텐데 append 시킬 필요가 없다. 그냥 이미 request에 있는 detailRequest 인스턴스를 index를 통해서 꺼내와서 그걸 가지고 놀면 된다.
                 request.detailRequestPerPerson.append(detailRequest)
                 */
                print(request.detailRequests)
                performSegue(withIdentifier: "LastCheckSegue", sender: self)
            }
            else {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.tableView.reloadData()
                
                containerVC.personSC.selectedSegmentIndex += 1
                /* 이미 request에 추가되어있을텐데 append 시킬 필요가 없다. 그냥 이미 request에 있는 detailRequest 인스턴스를 index를 통해서 꺼내와서 그걸 가지고 놀면 된다.
                 request.detailRequestPerPerson.append(detailRequest)
                 */
                self.selectedIndex = containerVC.personSC.selectedSegmentIndex
                
                if containerVC.personSC.selectedSegmentIndex == lastIndex {
                    currentButtonText = "작성 완료"
                    sender.setTitle(currentButtonText, for: .normal)
                }
                
                //selected된 버튼들 모두 풀기
                //어떤 Segment로 이동을 하던지간에 그 segment에 저장되어 있던 버튼의 Selected 설정이 저장이 되어있다가 어디 SegmentControl로 이동을 하든 저장되어 있던 세부 견적들이 selected 되어 있도록 보여져야 함.
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
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Function List
    //ContainerVC으로부터 Segment Control의 바뀐 Segment값을 가져와서 SC의 값이 바뀌었다면 self.tableView를 reloadData 시켜주는 함수
    func changeDataSet(_ num:Int) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        self.selectedIndex = containerVC.personSC.selectedSegmentIndex
        
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        self.tableView.reloadData()
    }
    
    //!를 누르면 나오는 View들을 세팅하는 함수
    func setting(infoViews : [UIView]) {
        for infoView in infoViews {
            infoView.layer.cornerRadius = 4.0
            infoView.layer.borderWidth = 1.0
            infoView.backgroundColor = UIColor.white
            infoView.layer.borderColor = CGColor(srgbRed: 121/255, green: 121/255, blue: 121/255, alpha: 1.0)
        }
    }
    
    //slider에 넣어둘 함수. 값에 따라서 들어가는 value가 다름
    @objc func changeValue(slider: UISlider) {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "AgeCell") as? AgeCell else {return}
        
        guard let containerVC = self.parent as? ContainerViewController else {return}
        guard let request = containerVC.request else {return}
        
        switch cell.ageSlider.value {
        case 0:
            let age = Age.teen
            cell.ageValue = age.rawValue
        case 1:
            let age = Age.twenty
            cell.ageValue = age.rawValue
        case 2 :
            let age = Age.thirty
            cell.ageValue = age.rawValue
        case 3:
            let age = Age.fourty
            cell.ageValue = age.rawValue
        case 4:
            let age = Age.fifty
            cell.ageValue = age.rawValue
        case 5:
            let age = Age.sixty
            cell.ageValue = age.rawValue
        case 6:
            let age = Age.seventy
            cell.ageValue = age.rawValue
        case 7:
            let age = Age.eighty
            cell.ageValue = age.rawValue
        case 8:
            let age = Age.ninety
            cell.ageValue = age.rawValue
        default:
            cell.ageValue = Age.teen.rawValue
        }
        
        request.detailRequests[selectedIndex].age = cell.ageValue
        print(request.detailRequests[selectedIndex].age)
        
    }
    
    //MARK:- IBActions
    //선택지 버튼들을의 tag를 통해 선택된 버튼들이 클릭되고 detailRequest.makingType에 추가되는 액션
    //선택된 버튼 말고 같은 cell에 있는 버튼들은 모두 deselected 되는 것도 함께 구현
    @IBAction func touchElementsBtn(_ sender: UIButton) {
        
        guard let containerVC = self.parent as? ContainerViewController else {return}
        guard let request = containerVC.request else {return}
        
        switch sender.tag {
        case 201:
            guard let exclusiveBtn = self.view.viewWithTag(202) as? UIButton else {return}
            if exclusiveBtn.isSelected == true {
                exclusiveBtn.isSelected = false
            }
            request.detailRequests[selectedIndex].makingType = MakingType.make.rawValue
            print(request.detailRequests[selectedIndex].makingType)
        case 202:
            guard let exclusiveBtn = self.view.viewWithTag(201) as? UIButton else {return}
            if exclusiveBtn.isSelected == true {
                exclusiveBtn.isSelected = false
            }
            request.detailRequests[selectedIndex].makingType = MakingType.borrow.rawValue
            print(request.detailRequests[selectedIndex].makingType)
        case 203:
            guard let exclusiveBtn = self.view.viewWithTag(204) as? UIButton else {return}
            if exclusiveBtn.isSelected == true {
                exclusiveBtn.isSelected = false
            }
            request.detailRequests[selectedIndex].fabric = Fabric.silk.rawValue
            print(request.detailRequests[selectedIndex].fabric)
        case 204:
            guard let exclusiveBtn = self.view.viewWithTag(203) as? UIButton else {return}
            if exclusiveBtn.isSelected == true {
                exclusiveBtn.isSelected = false
            }
            request.detailRequests[selectedIndex].fabric = Fabric.waterSilk.rawValue
            print(request.detailRequests[selectedIndex].fabric)
        case 205:
            guard let exclusiveBtn1 = self.view.viewWithTag(206) as? UIButton else {return}
            guard let exclusiveBtn2 = self.view.viewWithTag(207) as? UIButton else {return}
            guard let exclusiveBtn3 = self.view.viewWithTag(208) as? UIButton else {return}
            if exclusiveBtn1.isSelected == true || exclusiveBtn2.isSelected == true || exclusiveBtn3.isSelected == true {
                exclusiveBtn1.isSelected = false
                exclusiveBtn2.isSelected = false
                exclusiveBtn3.isSelected = false
            }
            request.detailRequests[selectedIndex].season = Season.spring.rawValue
            print(request.detailRequests[selectedIndex].season)
        case 206:
            guard let exclusiveBtn1 = self.view.viewWithTag(205) as? UIButton else {return}
            guard let exclusiveBtn2 = self.view.viewWithTag(207) as? UIButton else {return}
            guard let exclusiveBtn3 = self.view.viewWithTag(208) as? UIButton else {return}
            if exclusiveBtn1.isSelected == true || exclusiveBtn2.isSelected == true || exclusiveBtn3.isSelected == true {
                exclusiveBtn1.isSelected = false
                exclusiveBtn2.isSelected = false
                exclusiveBtn3.isSelected = false
            }
            request.detailRequests[selectedIndex].season = Season.summer.rawValue
            print(request.detailRequests[selectedIndex].season)
        case 207:
            guard let exclusiveBtn1 = self.view.viewWithTag(205) as? UIButton else {return}
            guard let exclusiveBtn2 = self.view.viewWithTag(206) as? UIButton else {return}
            guard let exclusiveBtn3 = self.view.viewWithTag(208) as? UIButton else {return}
            if exclusiveBtn1.isSelected == true || exclusiveBtn2.isSelected == true || exclusiveBtn3.isSelected == true {
                exclusiveBtn1.isSelected = false
                exclusiveBtn2.isSelected = false
                exclusiveBtn3.isSelected = false
            }
            request.detailRequests[selectedIndex].season = Season.fall.rawValue
            print(request.detailRequests[selectedIndex].season)
        case 208:
            guard let exclusiveBtn1 = self.view.viewWithTag(205) as? UIButton else {return}
            guard let exclusiveBtn2 = self.view.viewWithTag(206) as? UIButton else {return}
            guard let exclusiveBtn3 = self.view.viewWithTag(207) as? UIButton else {return}
            if exclusiveBtn1.isSelected == true || exclusiveBtn2.isSelected == true || exclusiveBtn3.isSelected == true {
                exclusiveBtn1.isSelected = false
                exclusiveBtn2.isSelected = false
                exclusiveBtn3.isSelected = false
            }
            request.detailRequests[selectedIndex].season = Season.winter.rawValue
            print(request.detailRequests[selectedIndex].season)
        default:
            print("unknown")
            return
        }
        
        print(request.detailRequests[selectedIndex])
        
        
    }
    
    
    //imagePicker에서 선택된 이미지를 처리해주는 액션.
    //이제 AF Image라는 라이브러리와 AWS S3라는 스토리지 서비스를 이용해서 여기에 더 추가시켜 사용자가 선택한 이미지를 서버에 저장시키도록 해야함.
    @IBAction func uploadImage(_ sender: UIButton) {
        
        guard let containerVC = self.parent as? ContainerViewController else {return}
        guard let request = containerVC.request else {return}
        
        let indexPath = IndexPath(row: 0, section: 4)
        
        guard let itemCell = tableView.cellForRow(at: indexPath) as? ImageCell else {return}
        
        let actionSheet = UIAlertController(title: "사진 선택", message: "원하는 디자인의 한복사진 선택해서 올리기", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "사장님이 추천해주세요", style: .default, handler: {(action : UIAlertAction) in
            
            itemCell.hanbokImage.image = UIImage(named: "recommendedByChairman")
            request.detailRequests[self.selectedIndex].detailImage = UIImage(named: "recommendedByChairman")
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "라이브러리에서 선택", style: .default, handler: {(action : UIAlertAction) in
            
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    //MARK:- table view data source methods
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
            
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FabricCell") as? FabricCell else {return defaultCell}
            
            cell.silkBtn.setTitle(Fabric.silk.rawValue, for: .normal)
            cell.waterSilkBtn.setTitle(Fabric.waterSilk.rawValue, for: .normal)
            
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AgeCell") as? AgeCell else {return defaultCell}
            
            cell.ageSlider.addTarget(self, action: #selector(changeValue), for: .touchUpInside)
            
            
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonCell") as? SeasonCell else {return defaultCell}
            
            cell.springBtn.setTitle(Season.spring.rawValue, for: .normal)
            cell.summerBtn.setTitle(Season.summer.rawValue, for: .normal)
            cell.fallBtn.setTitle(Season.fall.rawValue, for: .normal)
            cell.winterBtn.setTitle(Season.winter.rawValue, for: .normal)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell else {return defaultCell}
            
            
            return cell
        }
    }
    
    
    
    //MARK:- table view delegate methods
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
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let containerVC = self.parent as? ContainerViewController else {return}
        if segue.identifier == "LastCheckSegue" {
            if let destination = segue.destination as? LastCheckRequestTableViewController, let request = containerVC.request {
                destination.request = request
                
            }
        }
    }
    
    
}

//MARK:- imagePickerControllerDeleage Extension
//imagePickerControllerDeleage 관련 처리를 위해 존재
extension DetailRequestTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            
            guard let containerVC = self.parent as? ContainerViewController else {return}
            guard let request = containerVC.request else {return}
            
            let indexPath = IndexPath(row: 0, section: 4)
            guard let itemCell = tableView.cellForRow(at: indexPath) as? ImageCell else {return}
            itemCell.hanbokImage.image = image
            request.detailRequests[self.selectedIndex].detailImage = image
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
