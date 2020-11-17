//
//  LastCheckRequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/29.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit
import FirebaseStorage

class LastCheckRequestTableViewController: UITableViewController, UITextViewDelegate {
    
    //MARK:- 내부적으로 사용되는 변수들
    //이 VC에서 사용될 request 인스턴스
    var request = Request()
    var requestToServer = RequestToServer()
    //병렬, 동기 큐
    let dispatchGroup = DispatchGroup()
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestToServer.detailRequestsToServer = request.detailRequests.map({ (detailRequest) in
            var detailRequestToServer = DetailRequestToServer()
            detailRequestToServer.person = detailRequest.person
            detailRequestToServer.makingType = detailRequest.makingType
            detailRequestToServer.age = detailRequest.age
            detailRequestToServer.season = detailRequest.season
            detailRequestToServer.fabric = detailRequest.fabric
            if detailRequest.detailImage == UIImage(named: "recommendedByChairman") {
                detailRequestToServer.detailImage = "https://firebasestorage.googleapis.com/v0/b/last-60df7.appspot.com/o/defaultsImages%2FrecommendedByChairman.png?alt=media&token=014c4fee-7a68-4b59-84cb-4e330805cf02"
            }
            
            detailRequestToServer.memo = detailRequest.memo
            return detailRequestToServer
        })
        
        print(requestToServer)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    //    override func viewDidDisappear(_ animated: Bool) {
    //        let presentingVC = self.presentingViewController as? RequestTableViewController
    //        presentingVC?.tableView.reloadData()
    //    }
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        guard let presentingVC = self.presentingViewController as? RequestTableViewController else {return}
    //        presentingVC.tableView.reloadData()
    //    }
    
    // MARK: - IBActions
    // 최종적으로 요청을 신청하는 함수
    @IBAction func clickPostReqeustBtn(_ sender: UIButton) {
        
        //HIG에서 Alert 문에 "네", "아니오" 넣지 말라고 나옴
        let alertController = UIAlertController(title: "견적을 요청하시겠습니까?", message: "요청은 최대 3개 까지만 가능하며, 00일 이후 재 요청이 가능합니다.", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "요청하기", style: .default) { (_) in
            self.request.endDate = Date() + 1209600
            
            //DispatchGroup에 보면 함수 중에 모든 작업이 완료되었을때 noti를 받는게 있음. 이걸 이용해서 완료가 다 되었을때 그때 posting하는 부분 구현하고 그 다음에 performSegue를 하면 됨.
            
            self.getImageUrlAndPostRequest()
            //이미지들을 FBStorage에다가 올려서 url를 받아오고, 그리고 그걸 인스턴스에 추가한 다음 그 인스턴스를 서버에 업로드 시키려고 하는데 비동기 처리다보니까 일단 performSegue가 실행이 되는데, performSegue가 실행되기 전에 이 모든 작업이 끝내고 싶다. 왜냐하면 performSegue한 곳에서 get으로 서버에 올린 구조체를 받아와서 바로 뿌려주기 때문.
            
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
            
        }
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func getImageUrlAndPostRequest() {
        dispatchGroup.enter()
        
        for index in 0..<self.request.detailRequests.count {
            FBStorageService.instance.uploadRequestImage(self.request.detailRequests[index].detailImage!) { (url) in
                if let requestImageUrl = url?.absoluteString {
                    self.requestToServer.detailRequestsToServer[index].detailImage = requestImageUrl
                }
            }
        }
        self.dispatchGroup.leave()
        self.dispatchGroup.notify(queue: .main) {
            API.shared.postRequest(with: self.requestToServer) {
                self.performSegue(withIdentifier: "unwindToRequestTVCSegue1", sender: self)
            }
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = self.request.detailRequests.count
        return rowCount
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkRequestCell", for: indexPath) as? LastRequestTableViewCell else { return UITableViewCell() }
        
        let detailDescription = self.request.detailRequests[indexPath.row]
        let personDescription = self.request.detailRequests[indexPath.row].person
        let textViewText = cell.memoTextView.text! //--> ! 어떻게 없앨지 생각해보기
        
        cell.lastDescription?.text = "\(detailDescription.makingType)/\(personDescription)/\(detailDescription.age)/\(detailDescription.season)/\(detailDescription.fabric)"
        cell.lastImage?.image = detailDescription.detailImage
        //cell.memoTextView.text
        self.request.detailRequests[indexPath.row].defaultMemo(textViewText: textViewText) //여기서 request에 memo가 저장되는건가? 각 textField마다 어떻게 저장시킬지 알아보기
        //guard let textViewText = cell?.memoTextView.text else { return }
        //request.defaultMemo(textViewText: textViewText)
        
        cell.memoTextView.delegate = self
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "예) 신부 - 저고리 색깔을 더 연하게 하고 싶어요.\n시어머님 - 조끼를 추가하고 싶어요."
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    // MARK: - Navigation
    // UnwindSegue를 통해 견적 탭으로 이동
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "unwindToRequestTVCSegue1" {
            if let destination = segue.destination as? RequestTableViewController {
                user.myRequests.append(self.request)
                print(user)
                destination.tableView.reloadData()
            }
        }
    }
}


