//
//  StorageService.swift
//  HanDdam
//
//  Created by garlic on 2020/07/21.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import UIKit
import Firebase

//최상위 노드 가리킴 : gs://last-60df7.appspot.com/
fileprivate let baseRef = Storage.storage().reference()

class FBStorageService {
    static let instance = FBStorageService()
    
    //특정 데이터들이 저장되는 장소에 대한 레퍼런스
    //1. defaultImageAndMagazine -> 각 가게들의 image나 매거진(with 썸네일)이나 사장님이 추천해주세요 이미자
    let defaultImageAndMagazineRef = baseRef.child("defaultImageAndMagazine")
    
    //2. requestImages -> 유저들이 올린 images. 하위 참조를 하나 더 만들어서 거기에다가 올려야 함.
    let requestImagesRef = baseRef.child("requestImages")
    
    //3. biddingImages -> 사장님 분들이 올린 images.
    let biddingImagesRef = baseRef.child("biddingImages")
    
    func uploadRequestImage(_ image:UIImage, completion:@escaping ((_ url:URL?) -> Void)) {
        //uid를 어떻게 대체할지 생각해보기...
        //guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let imageName = NSUUID().uuidString
//        let ref = requestImagesRef.child("user\(/*유저의 pk*/)/request\(/*request의 pk*/)/\(imageName).jpeg")
        let ref = requestImagesRef.child("user/\(imageName).jpeg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.70) else {return}
        //guard let imageData = image.png
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        ref.putData(imageData, metadata: metaData) { (metadata, error) in
            if error == nil && metadata != nil {
                ref.downloadURL { (url, err) in
                    completion(url)
                }
            } else {
                completion(nil)
            }
        }
    }
}
