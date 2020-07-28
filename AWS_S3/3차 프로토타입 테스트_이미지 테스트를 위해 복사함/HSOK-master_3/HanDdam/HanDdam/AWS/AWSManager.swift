//
//  AWSManager.swift
//  HanDdam
//
//  Created by garlic on 2020/07/20.
//  Copyright © 2020 dong jun Kim. All rights reserved.
//

import Foundation
import AWSS3

typealias progressBlock = (_ progress: Double) -> Void

typealias completionBlock = (_ response: Any?, _ error: Error?) -> Void

typealias CompletionHandler = (_ success:Bool) -> Void

let aws_s3BucketName = "user-send-images-list"

class AWSManager {
    static let shared = AWSManager()
    
    private init () {}
    
    let bucketName = aws_s3BucketName
    
    
    // Upload image using UIImage object
    func uploadImage(image: UIImage, progress:progressBlock?, completion: completionBlock?) {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            let error = NSError(domain: "", code: 402, userInfo: [NSLocalizedDescriptionKey:"invalid image"])
            
            completion?(nil, error)
            return
        }
        
        let tmpPath = NSTemporaryDirectory() as String
        let fileName:String = ProcessInfo.processInfo.globallyUniqueString + (".jpeg")
        let filePath = tmpPath + "/" + fileName
        
        let fileUrl = URL(fileURLWithPath: filePath)
        
        do {
            try imageData.write(to: fileUrl)
            
            self.uploadFile(fileUrl: fileUrl, fileName: fileName, contentType: "image", progress: progress, completion: completion)
        }
        catch {
            let error = NSError(domain:"", code:402, userInfo:[NSLocalizedDescriptionKey: "invalid image"])
            completion?(nil, error)
        }
    }
    
    //Get unique file name
    func getUniqueFileName(fileUrl: URL) -> String {
        let strExt : String = "." + (URL(fileURLWithPath: fileUrl.absoluteString).pathExtension)
        
        return (ProcessInfo.processInfo.globallyUniqueString + (strExt))
    }
    
    //MARK:- AWS file upload
    
    //fileUrl: file local path url
    
    //fileName: name of file
    
    //contentType: file MIME type
    
    //progress: file upload progress, value from 0 to 1, 1 for 100% complete
    
    //completion: completion block when uploading is finish, we will get S3 url of upload file here
    
    private func uploadFile(fileUrl: URL, fileName:String, contentType: String, progress:progressBlock?, completion: completionBlock?) {
        
        //Upload progress block
        let expression = AWSS3TransferUtilityUploadExpression()
        
        //Mark ACL as public
        
        // expression.setValue("public-read", forRequestParameter: "x-amz-acl")
        // expression.setValue("public-read", forRequestHeader: "x-amz-acl")
        
        expression.progressBlock = {(task, awsProgress) in
            guard let uploadProgress = progress else {return}
            
            DispatchQueue.main.async {
                uploadProgress(awsProgress.fractionCompleted)
            }
        }
        
        //Completion Block
        
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = {(task, error) -> Void in
            DispatchQueue.main.async(execute: {
                if error == nil {
                    let url = AWSS3.default().configuration.endpoint.url
                    
                    let publicUrl = url?.appendingPathComponent(self.bucketName).appendingPathComponent(fileName)
                    
                    // print(“Uploaded to:\(String(describing: publicURL))”)
                    
                    if let completionBlock = completion {
                        completionBlock(publicUrl?.absoluteString, nil)
                    }
                } else {
                    if let completionBlock = completion {
                        completionBlock(nil, error)
                    }
                }
            })
        }
        
        //Start uploading using AWSS3TransferUtility
        
        let awsTransferUtility = AWSS3TransferUtility.default()
        awsTransferUtility.uploadFile(fileUrl, bucket: bucketName, key: fileName, contentType: contentType, expression: expression, completionHandler: completionHandler).continueWith { (task) -> Any? in
            if let error = task.error {
                print("error is: \(error.localizedDescription)")
            }
            
            if let _ = task.result {
                // your uploadTask
                // print("result is: \(result)")
            }
            
            return nil
        }
    }
}
