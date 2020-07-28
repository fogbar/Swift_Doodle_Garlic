//
//  RequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/29.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class RequestTableViewController: UITableViewController {
    
    var timer = Timer()
    
    //MARK:- IBOutlets
    //견적 추가하는 모달 올라오는 버튼
    @IBOutlet weak var addRequestButton: UIButton!
    //견적 탭에 있는 설명 Label
    @IBOutlet weak var listDescription: UILabel!
    
    //견적 탭에 요청이 추가되었을 경우 보여줄 DateFormatter.
    //-> 스위프트에도 몇 초에 한번씩 자동적으로 호출해주는 함수가 있음. 1초에 한번씩 tableView.reloadData() 동작시키면 됨
    //날짜 표시 -> 어떻게 하면 2주부터 최소 단위가 분 단위로 설정해놓고 줄어들도록 하는지 알아보기
    //참고 링크 : https://nsios.tistory.com/18?category=803407 -> 무조건 참고하기!
    /*
     let dateFormatter : DateFormatter = {
     let formatter : DateFormatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
     
     let currentTime = Date()
     let endTime = currentTime + 1209600 //일단은 이렇게 해주는데 서버에 endTime을 올리게 되면 그냥 get으로 받아와서 현재 시간만 빼면 됨
     
     //정해진 대로 할수도 있고
     //        formatter.dateStyle = .medium
     //        formatter.timeStyle = .medium
     //아래 놈처럼 직접 커스텀 시킬 수도 있음.
     //        formatter.dateFormat = "d일 HH시간 mm분"
     //우리가 원하는 것처럼 2주 카운트다운 할라면 interval를 건드려 봐야 겠네
     //이 링크 보고 커스텀해보기 : https://www.edwith.org/boostcourse-ios/lecture/16885/
     return formatter
     }()
     */
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //여기서 데이터를 가져온다. userNumber가 가지고 있는 Request들을 가지고 와줘.
        //즉, 내가 계속 가지고 있을 데이터는 userphoneNumber밖에 없다. 폰 번호를 가지고 새로운 request도 생성하고, 서버에 올라가 있는 request에 접근도 가능해진다.
        //중요한 것 : 화면 단위로 데이터를 받아와야 한다! -> 그럴려면 최소한 userPhoneNumber 정도는 있어야 한다.
        //전역변수로 처리하는 것은 힘들고 그렇게 해서는 안된다.
        
        //위 같은 과정을 viewDidLoad에서 할 수 있겠지만 효율이 안 좋음.
        //싱글톤을 써야하는 부분 : 모든 데이터를 싱글톤으로 만들라는게 아니라 데이터를 가져올 수 있는 함수를 싱글톤으로 만들어야 한다.
        
        //내가 해야하는 것! : 서버가 있다라고 생각하고 데이터 모델 작성해보기! 싱글톤으로 데이터 가져오는 함수도 하나 구현해보고.
        
        let nibName = UINib(nibName: "RequestListTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "RequestListCell")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 30)!]
        
        //user의 request가 하나 이상이라면 타임 카운트다운을 시작
        if user.myRequests.count > 0 {
            timeCountStart()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if user.myRequests.count == 0 {
            self.view.backgroundColor = .white
        } else {
            self.view.backgroundColor = UIColor.init(cgColor: CGColor(srgbRed: 242/255, green: 242/255, blue: 247/255, alpha: 1.0))
        }
        
        setAddRequestButton()
        setDescription()
        //유저가 앱을 껐다가 다시 들어오게 되었을때 여기다가 user 인스턴스에 접근을 하여서 tableView에 뿌려주기
        
        //user의 request가 하나 이상이라면 타임 카운트다운을 시작
        if user.myRequests.count > 0 {
            timeCountStart()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setAddRequestButton()
        setDescription()
        
        if user.myRequests.count == 0 {
            self.view.backgroundColor = .white
        } else {
            self.view.backgroundColor = UIColor.init(cgColor: CGColor(srgbRed: 242/255, green: 242/255, blue: 247/255, alpha: 1.0))
        }
    }
    
    //MARK:- IBActions
    //견적 탭의 "견적 추가하기" 버튼 클릭하면 동작하는 action. login 여부에 따라 분기해서 작동함.
    //참고 : token을 UserDefaults에 저장하면 앱이 처음에 켜질때 서버로 token을 보내 확인시킨다.
    @IBAction func ClickAddReqeustBtn(_ sender: UIButton) {
        //로그인 여부에 따라 false면 회원가입 창, true면 세부견적 작성 뷰 창을 띄움
            performSegue(withIdentifier: "modalDetailRequestVCSegue", sender: self)

    }
    //unwindSegue를 위해 작성된 action. LastCheckVC에서와 DetailBiddingTVC에서 작동함.
    @IBAction func unwindToRequestTVC(segue : UIStoryboardSegue) {
    }
    
    //MARK:- Function List
    //견적 추가하기 버튼 세팅
    func setAddRequestButton() {
        addRequestButton.layer.cornerRadius = 8.0
        addRequestButton.layer.borderWidth = 0.5
        addRequestButton.layer.borderColor = CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0)
        addRequestButton.tintColor = UIColor.init(cgColor: CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0))
        addRequestButton.setTitle("견적 추가하기", for: .normal)
        addRequestButton.setTitleColor(UIColor.init(cgColor: CGColor(srgbRed: 94/255, green: 94/255, blue: 115/255, alpha: 1.0)), for: .normal)
        addRequestButton.backgroundColor = UIColor.white
        
        //shadow
        addRequestButton.layer.shadowColor = UIColor(red: 0/255, green: 148/255, blue: 115/255, alpha: 1.0).cgColor
        addRequestButton.layer.shadowRadius = 9
        addRequestButton.layer.shadowOpacity = 0.4
        addRequestButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    //dateFormatter 세팅
    func setDateFormatter() {
        //Last Reqeust Check VC에서 alert 버튼 중 요청하기를 누르면 Date()인스턴스를 생성시키고 거기서 2주일을 더해서 마감일을 넣어서 그걸 서버에 전송을 시킨다.
        //여기 RequestTVC에서는 그 마감날짜에서 현재 Date를 생성을 시켜서 빼도록 한다. 이때 1분에 한 번씩 tableViewReloadData를 하도록 함수를 요청해놓는다.
    }
    
    //설명 Label 세팅
    func setDescription() {
        listDescription.text = "*견적을 작성하기 어려우시다면 홈을 참고해주세요. 다양한 꿀 정보와 한복 룩북, 리뷰를 보여드리고 있습니다"
        listDescription.numberOfLines = 0
        listDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    //timer 시작 함수
    func timeCountStart() {
        self.timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timeCount), userInfo: nil, repeats: true)
    }
    //endTime과 현재 Time이 같지 않다면 tableView를 reloadData 시키고 같다면 request를 삭제시킴. -> 삭제는 별개로 구현?
    //그런데 endTime과 현재 시각을 어떻게 구해와야하지?
    @objc func timeCount() {
        if user.myRequests.count > 0 {
            self.tableView.reloadData()
        } else {
            timeCountStop()
        }
    }
    //timer 멈추는 함수
    func timeCountStop() {
        timer.invalidate()
    }
    
    func returnDateCountString(with endTime:Date) -> String {
        //응답 견적을 몇 일 더 받을 수 있는지 보여주는 코드
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let now = Date()
        let currentTime = now
        //여기서 endTime은 GET으로 받아와야 함
        //endTime을 비동기로 받아오고 tableView를 1분마다 reload 시킨다라고 가정하면 줄어들 것 같다
        
        let endTime = endTime //일단은 이렇게 해주는데 서버에 endTime을 올리게 되면 그냥 get으로 받아와서 현재 시간만 빼면 됨
         
         let time = Int(endTime.timeIntervalSince(currentTime))
         let day : Int = time / 86400
         let hour : Int = day / 14400
         let minute  : Int = hour / 3600
         
         print(currentTime)
         print(endTime)
         
         return "요청 시간이 \(day)일 \(hour)시간 \(minute)분 남았습니다"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return user.myRequests.count //section을 request의 갯수로 지정해야함. 그래야 하나의 section에 여러개의 정보들을 row로 집어넣을 수 있음
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return user.myRequests[section].detailRequests.count //이건 detailRequest의 갯수로 넣어야함.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RequestListCell", for: indexPath) as? RequestListTableViewCell else {return UITableViewCell()}
        
        let userRequestListInSection = user.myRequests[indexPath.section]
        let detailConditions = userRequestListInSection.detailRequests[indexPath.row]
        
        //여기선 어떻게 cell에다가 왼쪽에는 대상, 가운데는 정보, 오른쪽에는 discloure와 indicator discloure를 넣을지 생각해보기. 짜피 하나의 cell만 정해놓으면 나머지는 정보들만 집어넣으면 되니깐.(indexpath 통해서)
        
        cell.personLabel.text = userRequestListInSection.detailRequests[indexPath.row].person
        cell.detailLabel.text = "\(detailConditions.makingType)/\(detailConditions.fabric)/\(detailConditions.age)/\(detailConditions.season)"
        
        cell.personLabel.sizeToFit()
        cell.detailLabel.sizeToFit()
        
        
        
        
        
        return cell
    }
    
    //MARK: - table view delegate Method
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 50.0
        return height
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView : UIView?
        headerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:50))
        headerView?.backgroundColor = UIColor.clear
        
        let requestNumber = UILabel(frame: CGRect(x: 30, y: 20, width: 100, height: 30))
        //CGRect는 부모뷰의 origin 기준임.
        requestNumber.font = UIFont.boldSystemFont(ofSize: 20)
        requestNumber.textColor = UIColor.black
        requestNumber.text = "요청 \(String(section + 1))"
        
        let dateCounter = UILabel(frame: CGRect(x: 160, y: 20, width: 270, height: 30))//DataFormatter를 통해 시간 얻어내는 법 알아내서 구현해야함.
        dateCounter.font = UIFont.systemFont(ofSize: 10)
        dateCounter.textColor = UIColor(cgColor: CGColor(srgbRed: 0/255, green: 148/255, blue: 115/255, alpha: 1.0))
        
        guard let endDate = user.myRequests[section].endDate else {return UIView()}
        
        dateCounter.text = returnDateCountString(with: endDate)
        
        headerView?.addSubview(requestNumber)
        headerView?.addSubview(dateCounter)
        
        //어떻게해야 각 section마다 집어넣을 수 있을까?
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let biddingTVC = self.storyboard?.instantiateViewController(identifier: "BiddingTVC") as? BiddingTableViewController else {return}
        
        //Indexpath에 대한 입찰 정보들이 뜨도록 해야하는데... 흐음... 일단 biddingVC에서 상인들이 넣은 정보들을 어떻게 보여줄건지에 대해서 그리고 보여주는게 구체화 되면 여기서 찾은 IndexPaht에 해당하는 입찰 정보들을 가져올 수 있도록 해야겠음.
        
        biddingTVC.navigationItem.title = "'요청 \(indexPath.row + 1)'에 대한 견적"
        biddingTVC.navigationItem.largeTitleDisplayMode = .never
        
        self.navigationController?.pushViewController(biddingTVC, animated: true)
        
        //만약 클릭시에 선택되어 있는 것을 끄고 싶다면 아래 코드를 활성화시키세요
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    //        guard let showInfoTVC = self.storyboard?.instantiateViewController(identifier: "ShowRequestInfoTVC") as? ShowRequestInfoTableViewController else {return}
    //
    //        //ShowRequestInfoVC의 UI가 나오면 UI를 먼저 구현하고 그냥 User에서 정보가져와서 뿌리면 되니까 큰 무리 없을 것 같음
    //
    //        self.navigationController?.pushViewController(showInfoTVC, animated: true)
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
