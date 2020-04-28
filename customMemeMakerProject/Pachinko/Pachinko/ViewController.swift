//
//  ViewController.swift
//  Pachinko
//
//  Created by 김동준 on 2020/04/02.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var slider: UISlider!
    
    var imageArray = [UIImage]()
    var wordArray = [String]()
    
    let imageNames : [String] = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8", "image9", "image10", "image11", "image12", "image13", "image14", "image15", "image16", "image17", "image18", "image19", "image20", "image21", "image22", "image23", "image24", "image25", "image26", "image27", "image28", "image29", "image30", "image31", "image32", "image33", "image34", "image35", "image36", "image37", "image38", "image39", "image40", "image41", "image42", "image43", "image44", "image45", "image46", "image47", "image48", "image49", "image50", "image51", "image52", "image53", "image54", "image55", "image56", "image57", "image58", "image59", "image60", "image61", "image62", "image63", "image64", "image65", "image66", "image67", "image68", "image69", "image70", "image71", "image72", "image73", "image74", "image75", "image76", "image77", "image78", "image79", "image80", "image81", "image82", "image83", "image84", "image85", "image86", "image87", "image88", "image89", "image90", "image91", "image92", "image93", "image94", "image95", "image96", "image97", "image98", "image99", "image100"]
    
    var sliderState : SliderState = .up
    
    var selectedImage : UIImage?
    var selectedWord1 : String = ""
    var selectedWord2 : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.addTarget(self, action: #selector(self.scrollDownSlider(sender:)), for: .valueChanged)
        slider.value = 0
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        
        for name in imageNames {
            guard let unwrappedImage = UIImage(named: name) else {return}
            imageArray.append(unwrappedImage)
        }
        
        wordArray = ["사장님", "퉁퉁이", "도라에몽", "안경", "화장실", "피시방", "젓가락", "집", "놀이공원", "사회", "호랑이", "승부", "감기", "노트북", "연필", "테니스", "축구", "호박", "인형", "시계", "생리식염수", "붓", "립밤", "사전", "자", "핸드폰", "숙제", "스탠드", "휴지통", "마스크", "왕자", "승자", "패자", "공주", "영어", "컴퓨터", "바리스타", "커피", "강도", "은행", "자습", "롤러코스터", "노진구", "호빵", "기차", "친구", "엄마", "아빠", "티비", "방탄소년단", "지나가는 행인", "장점", "단점", "오레오", "천원", "선생님", "아저씨", "머리", "탈모", "알바", "택배", "군대", "주사", "거짓말", "진실", "아침", "점심", "저녁", "새우깡", "소주", "맥주", "천원", "만원", "알바비", "시급", "가위", "라면", "각도기", "약", "노래", "세금", "유모차", "아기", "질주", "수치심", "숱", "삼각형", "사각형", "콘센트", "눈", "코", "입", "귀", "안전", "이빨", "이름", "치킨", "꿈", "연예인", "던전"]
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
//        if segue.identifier == "MainSegue" {
//            if let sourceVC = segue.source as? MakeMemeVC {
//                switch sourceVC.presentingViewController {
//                case let navigationC as UINavigationController:
//                    if let vc = navigationC.topViewController as? ViewController {
//                        vc.performSegue(withIdentifier: "goToMyListViewSegue", sender: self)
//                    }
//                case let vc as ViewController :
//                    vc.performSegue(withIdentifier: "goToMyListViewSegue", sender: self)
//                default:
//                    break
//                }
//            }
//
//            //self.performSegue(withIdentifier: "goToMyListViewSegue", sender: self)
//        }
    }
    
    @IBAction func moveToMakeMemeVC(_ sender: UIButton) {
        guard let makeMemeVC = self.storyboard?.instantiateViewController(identifier: "MakeMemeVC") as? MakeMemeVC else {return}
        
        makeMemeVC.modalPresentationStyle = UIModalPresentationStyle.automatic
        
        makeMemeVC.deliveredImage = selectedImage
        makeMemeVC.wordOfLabel1 = self.selectedWord1
        makeMemeVC.wordOfLabel2 = self.selectedWord2
        
        self.present(makeMemeVC, animated: true)
    }
    
    
    @objc func scrollDownSlider(sender: UISlider) {
        if sender.value == 1.0 {
            self.sliderState = .down
        } else {
            self.sliderState = .up
        }
        
        changeImage(state: sliderState)
    }
    
    func changeImage(state:SliderState) {
        switch state {
        case .up:
            print(slider.value)
        case .down:
            let randomNumber = GKRandomDistribution(lowestValue: 0, highestValue: 99)
            let randomNumberOne = randomNumber.nextInt()
            let randomNumberTwo = randomNumber.nextInt()
            let randomNumberThree = randomNumber.nextInt()
            
            pickerView.selectRow(randomNumberOne, inComponent: 0, animated: true)
            pickerView.selectRow(randomNumberTwo, inComponent: 1, animated: true)
            pickerView.selectRow(randomNumberThree, inComponent: 2, animated: true)
            print(slider.value)
            self.slider.value = 0.0
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return 100
        switch component {
        case 0:
            return imageArray.count
        case 1:
            return wordArray.count
        case 2:
            return wordArray.count
        default:
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerImageView = UIImageView()
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .center
        
        switch component {
        case 0:
            pickerImageView.image = imageArray[row]
            self.selectedImage = pickerImageView.image
            print(row)
            break
            
        case 1:
            pickerLabel.text = wordArray[row]
            if let text = pickerLabel.text {
                selectedWord1 = text
            }
            return pickerLabel
            
        case 2:
            pickerLabel.text = wordArray[row]
            if let text = pickerLabel.text {
                selectedWord2 = text
            }
            return pickerLabel
            
        default:
            pickerImageView.image = imageArray[row]
        }
        print(selectedComponent)
        
        return pickerImageView
        
    }
    
    
    
//        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//            switch component {
//            case 0:
//                selectedImageInPickerView = imageArray[row]
//            case 1:
//                selectedWord1InPickerView = wordArray[row]
//            case 2:
//                selectedWord2InPickerView = wordArray[row]
//            default:
//                selectedImageInPickerView = imageArray[row]
//            }
//            selectedComponent.selectedImage = selectedImageInPickerView
//            selectedComponent.selectedword1 = selectedWord1InPickerView
//            selectedComponent.selectedword2 = selectedWord2InPickerView
//
//            print(selectedComponent)
//        }
    
}


