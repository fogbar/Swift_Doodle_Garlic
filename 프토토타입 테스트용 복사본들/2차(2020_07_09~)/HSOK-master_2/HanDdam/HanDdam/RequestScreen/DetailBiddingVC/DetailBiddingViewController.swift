//
//  DetailBiddingViewController.swift
//  HanDdam
//
//  Created by garlic on 2020/07/07.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit
import MessageUI

//다다꺼 폰 번호
let storeNumber = "01036117587"

//MARK:- MessageComposer
class MessageComposer: NSObject, MFMessageComposeViewControllerDelegate {
    
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposeVC = MFMessageComposeViewController()
        messageComposeVC.messageComposeDelegate = self
        messageComposeVC.recipients = [storeNumber]
        messageComposeVC.body = ""
        return messageComposeVC
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
}

//MARK: - DetialBiddingVC
class DetailBiddingViewController: UIViewController {
    
    //MARK: 내부적으로 사용하는 변수들
    //DummyDataSources
    var basicInfoTitle = "노리개, 속치마, 속바지, 꽃신, 버선"
    var commentTableViewTitleArr = ["한복 디자인", "한복 색감", "디테일", "참고사항"]
    var commentArr = ["요즘은 당위를 추가 안하는게 유행이에요~ 저고리만 짧게 하는게 사진 찍었을 때 비율도 좋아 보이고요. 신부님이 고르신 색감에서 당위를 추가하시면 10만원이 추가되는 점 알려드려요 ㅎㅎ\n신랑분거는 사진에 있는 디자인 그대로 가고 색감은 신부님한테 어울리게 가는게 좋아요. 어머니들은 자수를 좀 더 화려하게 넣으면 좋을 것 같네요. 더 자세한 취향은 오시면 함께 고려하면 좋을 것 같아요~", "신부님이 젊으신 편이니까 톤을 좀 더 명랑하게 해도 좋을 것 같아서 저고리에 노란빛을 넣으면 어떨까요? 예시사진 보내드릴게요 참고 해보세요~ㅎㅎ", "신부님이 요청해주신 사진에는 수가 잘 안보여서 제가 추천해드리는 수 보여드릴게요. 요즘 잘나가는 수는 파스텔톤 분홍색 꽃수인데, 신부님이 골라주신 한복에는 좀 더 간단한 수가 어울릴 것 같아서 이걸로 추천해드려요~ 이걸로 수 추가하시면 추가값은 없는 점 참고 해주세요~ 어머님들은 저고리가 자수가 화려하게 들어가면 소매수는 저고라와 같은 색으로 단조롭게 하는게 더 예쁠 것 같네요", "노리개, 속치마, 버선, 꽃신, 가방은 서비스로 끼워드리니 걱정 마세요~ 버선도 예쁜거 끼워드릴게요~"]
    var headerArr = ["", "한복 가격정보", "서비스 상품", "한복집 코멘트"]
    
    //MARK: message 관련
    let messageComposer = MessageComposer()
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageToStoreBtn: UIButton!
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView에 cell 추가
        let nib1 = UINib(nibName: "CertificationCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "certificationCell")
        let nib2 = UINib(nibName: "PriceCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "priceCell")
        let nib3 = UINib(nibName: "ServiceCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "serviceCell")
        let nib4 = UINib(nibName: "CommentCell", bundle: nil)

        self.tableView.register(nib4, forCellReuseIdentifier: "commentCell")
        
        //tableView 세팅
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        
        //messageToStoreBtn Setting
        messageToStoreBtn.layer.cornerRadius = 8.0
    }
    
    //MARK:- IBActions
    //가게에 message를 보내기 위해 Message가 모달로 나오는 액션
    @IBAction func sendMessageToStore(_ sender: UIButton) {
        if messageComposer.canSendText() {
            let messageComposerVC = messageComposer.configuredMessageComposeViewController()
            present(messageComposerVC, animated: true, completion: nil)
        } else {
            print("메시지를 보낼 수 없습니다.")
        }
    }
    
    //MARK: 전화거는 Action (현재는 필요없어서 지움)
    //    @IBAction func callToStore(_ sender: UIButton) {
    //        if let phoneCallURL:URL = URL(string: "tel://\(storeNumber)") {
    //            let application:UIApplication = UIApplication.shared
    //            if (application.canOpenURL(phoneCallURL)) {
    //                let alertController = UIAlertController(title: "한땀", message: "Are you sure you want to call \n\(storeNumber)?", preferredStyle: .actionSheet)
    //                let yesPressed = UIAlertAction(title: "Yes", style: .default) { (action) in
    //                    application.open(phoneCallURL, options: [:], completionHandler: nil)
    //                }
    //                let noPressed = UIAlertAction(title: "No", style: .default) { (action) in
    //
    //                }
    //                alertController.addAction(yesPressed)
    //                alertController.addAction(noPressed)
    //                present(alertController, animated: true, completion: nil)
    //            }
    //        }
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


extension DetailBiddingViewController : UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    
    //일단은 Static하게 만들어놓기
    // section 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    // rowInSection 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else {
            return 4
        }
    }
    
    // CertificationBtn에 추가될 Action -> 원래라면 눌렀을때 마이페이지에 있는 견적 증빙서 한눈에 보기 칸으로 이동을 해야하는데 지금 그걸 어떻게 하는지 잘 모르겠음. 그러니까 일단은
    @objc func clickCertificationBtn() {
        let alertController = UIAlertController(title: "견적 증빙서를 발급하시겠습니까?", message: """
* 한복 실거래 시 필요한 견적 증빙서 발급은 최대 3회 요청당 한 번만 할 수 있으니, 사장님들과 충분히 대화를 나눈 후 신중하게 결정해주세요. (증빙서 발급시 이전 요청 내용은 모두 취소되며, 일주일 뒤부터 재 요청이 가능합니다.)  * 확인은 {마이페이지} - [견적 증빙서 한눈에 보기] 에서 확인해 주세요
""", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "네", style: .default) { (_) in
            //일단은 견적 탭으로 이동하기
            self.performSegue(withIdentifier: "unwindToReqeustTVCSegue2", sender: self)
        }
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel) { (_) in
            
        }
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        if indexPath.section == 0 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "certificationCell") as? CertificationCell else {return defaultCell}
            cell.issueCertificationBtn.addTarget(self, action: #selector(clickCertificationBtn), for: .touchUpInside)
            return cell
        } else if indexPath.section == 1 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "priceCell") as? PriceCell else {return defaultCell}
            cell.priceLabel.text = "신부맞춤(저고리+치마+서비스) + 신랑대여(저고리+바지) + 할인 5만원 = 40만원 + 15만원 - 5만원 = 50만원"
            cell.contentView.backgroundColor = UIColor(red: 0.73, green: 0.89, blue: 0.88, alpha: 1.00)
            return cell
        } else if indexPath.section == 2 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "serviceCell") as? ServiceCell else {return defaultCell}
            cell.serviceLabel.text = basicInfoTitle
            cell.contentView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
            return cell
        } else {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "commentCell") as? CommentCell else {return defaultCell}
            cell.titleLabel.text = commentTableViewTitleArr[indexPath.row]
            cell.commentLabel.text = commentArr[indexPath.row]
            cell.contentView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            return cell
        }
    }
    
    //MARK:- table view delegate method
    // estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100.0
        } else if indexPath.section == 1 {
            return 120.0
        } else if indexPath.section == 2 {
            return 120.0
        } else {
            return 300.0
        }
    }
    
    // viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView:UIView?
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 50))
        headerView?.backgroundColor = UIColor.clear
        
        let title = UILabel(frame: CGRect(x:0, y:10, width:300, height:30)) //이거 정확한 값 알아내기
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
        
        if section == 0 {
            title.text = headerArr[section]
        } else if section == 1 {
            title.text = headerArr[section]
        } else if section == 2 {
            title.text = headerArr[section]
        } else {
            title.text = headerArr[section]
        }
        
        headerView?.addSubview(title)
        return headerView
    }
    
    // heightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 50
        return height
    }
    
}
