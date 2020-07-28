//
//  LastCheckRequestTableViewController.swift
//  HanDdam
//
//  Created by 김동준 on 2020/01/29.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import UIKit

class LastCheckRequestTableViewController: UITableViewController, UITextViewDelegate {
    
    //MARK:- 내부적으로 사용되는 변수들
    //이 VC에서 사용될 request 인스턴스
    var request = Request()
    
    //MARK:- ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            self.performSegue(withIdentifier: "unwindToRequestTVCSegue1", sender: self)
            //여기서부터 타이머 시작
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
            
        }
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
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
