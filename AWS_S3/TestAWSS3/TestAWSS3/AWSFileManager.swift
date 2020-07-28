//
//  AWSFileManager.swift
//  TestAWSS3
//
//  Created by garlic on 2020/07/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import Foundation
import UIKit

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func saveFileAtDocumentsDirectory(data:Data, fileName:String) {
    let fileManager = FileManager.default
    
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(fileName)
    
    fileManager.createFile(atPath: paths as String, contents: data, attributes: nil)
}

func filesInDocumentDirectory() {
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    do {
        let items = try fm.contentsOfDirectory(atPath: path)
        for item in items {
            print("Found \(item)")
        }
    } catch {
        // failed to read directory — bad permissions, perhaps?
    }
}


func createAWSDocumentsDirectory() {
    let fileManager = FileManager.default
    let newDir = getDocumentsDirectory().appendingPathComponent("AWSDirectory").path
    do {
        try fileManager.createDirectory(atPath: newDir, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
        print("Error: \(error)")
    }
}


func getAWSDocumentsDirectoryUrl() -> URL {
    return getDocumentsDirectory().appendingPathComponent("AWSDirectory")
}


func saveFileAtAtAWSDocumentsDirectory(data:Data, fileName:String, completionHandler:@escaping CompletionHandler) {
    let fileManager = FileManager.default
    let paths = getAWSDocumentsDirectoryUrl().appendingPathComponent(fileName).path
    
    if(!fileManager.fileExists(atPath: paths)) {
        fileManager.createFile(atPath: paths as String, contents: data, attributes: nil)
        completionHandler(true)
    } else {
        completionHandler(true)
    }
}

func getFilesPathFromAWSDocumentsDirectory() -> Array<String> {
    let fileManager = FileManager.default
    do {
        let fileList = try fileManager.contentsOfDirectory(atPath: getAWSDocumentsDirectoryUrl().path)
        for fileName in fileList {
            print(fileName)
        }
        return fileList
    } catch let err {
        print("Error: \(err)")
    }
    return []
}

func getFileType(fileName:String) -> String {
    let fileType = fileName.fromStringToEnd(".")
    if (fileType == "pdf") {
        return "pdf"
    } else if (fileType == "jpeg") {
        return "jpeg"
    }
    return ""
}

func getCellImage(fileName:String) -> String {
    let fileType = fileName.fromStringToEnd(".")
    if (fileType == "pdf") {
        return "pdf"
    } else if (fileType == "jpeg") {
        return "jpeg"
    }
    return ""
}

func saveToDocumentDirectory(data:Any, fileName:String, completionHandler:@escaping CompletionHandler) {
    print(getDocumentsDirectory())
    let fileType = fileName.fromStringToEnd(".")
    
    if (fileType == "pdf") {
        saveFileAtAtAWSDocumentsDirectory(data: data as! Data, fileName: fileName) {(success) in
            if success {
                print("success")
                completionHandler(true)
            } else {
                print("failure")
                completionHandler(false)
            }
        }
    } else if (fileType == "jpeg") {
        saveFileAtAtAWSDocumentsDirectory(data: data as! Data, fileName: fileName) { (success) in
            if success {
                print("success")
                completionHandler(true)
            } else {
                print("failure")
                completionHandler(false)
            }
        }
    }
}
