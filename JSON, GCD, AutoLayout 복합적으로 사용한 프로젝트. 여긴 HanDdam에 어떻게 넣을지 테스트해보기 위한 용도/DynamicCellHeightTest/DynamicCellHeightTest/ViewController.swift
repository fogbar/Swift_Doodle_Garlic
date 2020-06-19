//
//  ViewController.swift
//  DynamicCellHeightTest
//
//  Created by garlic on 2020/05/15.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //스택 뷰를 통해서 이미지가 여러개일 경우에는 어떻게 처리할지 생각해보자.
    
    //done
    let jsonUrl = "file:///Users/mac/Desktop/jsonFiles/imageList.json"
    var imageUrlArr : [Image] = []
    
    
    //done.
    var headerArr = ["한복 가격정보", "한복 기본정보", "한복집 코멘트"]
    //done
    var basicInfoTitleArr = ["맞춤/대여 과정과 소요기간", "서비스 상품", "원산지와 제조지"]
    //done
    var basicInfoTextArr = ["재봉 기간: 2주 + 가봉 기간: 1주 = 총 소요시간: 3주", "노리개, 속치마, 속바지, 꽃신, 버선", "원단 - 국내 원주산\n자수 - 국내산, 중국산"]
    
    //done
    var commentTableViewTitleArr = ["한복 디자인", "한복 색감", "디테일", "참고사항"]
    //done
    var commentArr = ["요즘은 당위를 추가 안하는게 유행이에요~ 저고리만 짧게 하는게 사진 찍었을 때 비율도 좋아 보이고요. 신부님이 고르신 색감에서 당위를 추가하시면 10만원이 추가되는 점 알려드려요 ㅎㅎ\n신랑분거는 사진에 있는 디자인 그대로 가고 색감은 신부님한테 어울리게 가는게 좋아요. 어머니들은 자수를 좀 더 화려하게 넣으면 좋을 것 같네요. 더 자세한 취향은 오시면 함께 고려하면 좋을 것 같아요~", "신부님이 젊으신 편이니까 톤을 좀 더 명랑하게 해도 좋을 것 같아서 저고리에 노란빛을 넣으면 어떨까요? 예시사진 보내드릴게요 참고 해보세요~ㅎㅎ", "신부님이 요청해주신 사진에는 수가 잘 안보여서 제가 추천해드리는 수 보여드릴게요. 요즘 잘나가는 수는 파스텔톤 분홍색 꽃수인데, 신부님이 골라주신 한복에는 좀 더 간단한 수가 어울릴 것 같아서 이걸로 추천해드려요~ 이걸로 수 추가하시면 추가값은 없는 점 참고 해주세요~ 어머님들은 저고리가 자수가 화려하게 들어가면 소매수는 저고라와 같은 색으로 단조롭게 하는게 더 예쁠 것 같네요", "노리개, 속치마, 버선, 꽃신, 가방은 서비스로 끼워드리니 걱정 마세요~ 버선도 예쁜거 끼워드릴게요~"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        let nib1 = UINib(nibName: "Section1TableViewCell", bundle: nil)
        self.tableView.register(nib1, forCellReuseIdentifier: "Section1Cell")
        
        let nib2 = UINib(nibName: "Section2TableViewCell", bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "Section2Cell")
        
        let nib3 = UINib(nibName: "Section3TableViewCell", bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "Section3Cell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parseJson(with: self.jsonUrl)
    }
    
    //가격과 할인 부분은 스택뷰 -> 레이블만 들어감
    //한복 기본정보도 스택뷰 -> 레이블만 들어감
    //한복집 코멘트는 스택뷰로 묶는데 레이블 하나랑 테이블 뷰 하나로 묶자. 이때 테이블 뷰에는 셀로 imageView 하나 넣어놓기.
    //스택뷰에 이미지 뷰를 10개 정도 넣을 수 있게 만들어놓고 숨겨놨다가 보여지도록 하고, 상인 분들께는 이미지를 10개 이상 첨가하지 말아달라고 하기.
    
    //이 작업은 cell에서 스크롤 될때마다 계속하는게 아니라 VC에서 가져오고 그걸 가지고 한 번에 뿌려주는 것. -> 그래서 VC으로 옮김
    func parseJson(with jsonUrl:String) {
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do {
                //오케이 여기서 안되는 이유는 box에서 제공하는 무료 url를 써서 그렇고만.
                //json만 제공되는게 아니라 box가 같이 떠버리네.
                let imageList = try JSONDecoder().decode(ImageList.self, from: data)
                print(imageList)
                self.imageUrlArr = imageList.images
                print(self.imageUrlArr)
                //여기서 image의 갯수만큼 imageView를 생성하는 함수 작성 하고 그 내부에서 imageView.image에 이미지 넣기 실행
                if self.imageUrlArr.count != 0 {
                    for i in 1...self.imageUrlArr.count {
                        //여기서 makeimageViewAndLoadimage 함수를 같이 돌려서 imageView를 생성시킨 다음에 거기다가 넣는 식으로 해도 괜찮은데?
                        DispatchQueue.main.async {
                            self.makeImageViewAndLoadImage()
                        }
                        let urlString = self.imageUrlArr[i - 1].url
                        if let imageUrl = URL(string: urlString) {
                            do {
                                let data = try Data(contentsOf: imageUrl)
                                //여기서 함수에서 data를 매개변수로 받는 놈을 만들고 거기서 imageView에 넣는 식으로 가야할라나?
                                DispatchQueue.main.async {
                                    guard let imageCell = UITableViewCell.init() as? Section3TableViewCell else {return}
                                    
                                    //data도 mainQueue안에서 처리해야 하는 건가?
                                    guard let imageView = imageCell.imageListStackView.arrangedSubviews[i - 1] as? UIImageView else {return}
                                    imageView.image = UIImage(data: data)
                                }
                            }
                            catch let err {
                                print(err)
                            }
                        }
                    }
                }
            }
            catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    
    func makeImageViewAndLoadImage() {
        //👇얘는 main 에서 처리를 해야함.
        guard let imageCell = UITableViewCell.init() as? Section3TableViewCell else {return}
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //true 면 frame값이 먹고 false면 auto layout 값이 먹는다
        
        imageView.widthAnchor.constraint(equalTo: imageCell.imageListStackView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        imageCell.imageListStackView.addArrangedSubview(imageView)
        //여기서 하나씩 만들어서 for 문 에다가 돌려서 그것만큼 imageView를 리턴 시키는 법도 있지만, 그냥 json 내부의 image가 몇개인지 확인 후에 그것 만큼 imageView를 생성시키도록 하고 그걸 위에 선언되어 있는 imageView들의 배열을 하나 만들어서 거기다가 append를 시켜서 그걸 stackView의 arrangedSubView에 집어 넣도록 하면 될듯.
        //이게 하나씩 넣기보다는, 그냥 한 번에 넣어야 stackView 내부에서 알아서 height 추론도 하고, 무엇보다 stackView가 각각의 imageView들의 크기를 계산해서 알맞게 배열할 수 있도록 해야하기 때문이다. --> 그냥 비동기처리해서 서버에서 가져온 다음에 그걸 self.imageViewArr에 넣어서 한 번에 넣으면 될듯.
    }
    
    func jsonToString(json: Data) {
        
    }
    
    //TextField 입력시에 guard let을 통해 모두 값들을 확인 후 그 값들을 인스턴스로 넣어버리면 될듯!
    
    
    
    
    
    
    
    
    
    //MARK: Section 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //MARK: RowInSection 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else {
            return 4
        }
        //imageView쪽은 Section3에서 그냥 row를 4개 할당하는게 낫겠다. 그렇게해서 각 row마다 똑같은 stackView를 만들어서 그게 들어가도록 하면 되지않을까? 그러면 section3에서는 애초부터 row가 4개로 들어가지니까 cellForRowAt에서 그냥 cell을 찾아서 할당만하면 알아서 반복될꺼 아녀? -> 일단 section 1,2부터 해결해보자.
    }
    //MARK: cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        if indexPath.section == 0 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Section1Cell") as? Section1TableViewCell else {return defaultCell}
            cell.section1Label.text = "신부맞춤(저고리+치마+서비스) + 신랑대여(저고리+바지) + 할인 5만원 = 40만원 + 15만원 - 5만원 = 50만원"
            cell.contentView.backgroundColor = UIColor(red: 0.73, green: 0.89, blue: 0.88, alpha: 1.00)
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Section2Cell") as? Section2TableViewCell else {return defaultCell}
            cell.titleLabel.text = basicInfoTitleArr[indexPath.row]
            cell.commentLabel?.text = basicInfoTextArr[indexPath.row]
            cell.contentView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
            return cell
        } else {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Section3Cell") as? Section3TableViewCell else {return defaultCell}
            cell.titleLabel.text = commentTableViewTitleArr[indexPath.row]
            cell.commentLabel.text = commentArr[indexPath.row]
            cell.contentView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            return cell
        }
    }
    
    //MARK: estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120.0
        } else if indexPath.section == 1 {
            return 120.0
        } else {
            return 300.0
        }
    }
    //MARK: viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView:UIView?
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 50))
        headerView?.backgroundColor = UIColor.white
        
        let title = UILabel(frame: CGRect(x:0, y:10, width:300, height:30)) //이거 정확한 값 알아내기
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
        
        if section == 0 {
            title.text = headerArr[section]
        } else if section == 1 {
            title.text = headerArr[section]
        } else {
            title.text = headerArr[section]
        }
        
        headerView?.addSubview(title)
        return headerView
    }
    //MARK: heightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat
        height = 50
        return height
    }
    
    
}

