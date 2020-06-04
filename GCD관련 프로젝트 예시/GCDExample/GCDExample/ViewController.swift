//
//  ViewController.swift
//  GCDExample
//
//  Created by garlic on 2020/06/01.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //이 프로젝트는 TestGCD 프로젝트에 있는 것 중 코더스하이 포럼에다가 올린 것만 가져와서 복붙한 것임.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let queue = DispatchQueue(label: "MyQueue")
        //
        //        queue.async {
        //            print("Task1 Done")
        //        }
        //        print("Task1 queued")
        //
        //        queue.sync {
        //            print("Task2 Done")
        //        }
        //        print("Task2 queued")
                
                //1차 시도
                /*
                 Task1 queued
                 Task1 Done
                 Task2 Done
                 Task2 queued
                 */
                
                //2차 시도
                /*
                 Task1 queued
                 Task1 Done
                 Task2 Done
                 Task2 queued
                 */
                
                //3차 시도
                /*
                 Task1 Done
                 Task1 queued
                 Task2 Done
                 Task2 queued
                 */
                
                //4차 시도
                /*
                 Task1 queued
                 Task1 Done
                 Task2 Done
                 Task2 queued
                 */
                
                //5차 시도
                /*
                 Task1 Done
                 Task1 queued
                 Task2 Done
                 Task2 queued
                 */
                
                //☝️무조건 task2는 순서대로 나옴. 다만 task1은 async라서 먼저 끝나는 업무 먼저 나옴. 이건 Serial 이니 무조건 Task1 끝나고 Task2가 실행되겠지.
                
                //--------------------------------------------------------------------------------------------

        //        let queue = DispatchQueue(label: "MyQueue", attributes: .concurrent)
        //
        //            queue.async {
        //                print("Task1 Done")
        //            }
        //            print("Task1 queued")
        //
        //            queue.sync {
        //                print("Task2 Done")
        //            }
        //            print("Task2 queued")
                
                //1차 시도
                /*
                 Task1 Done
                 Task1 queued
                 Task2 Done
                 Task2 queued
                 */
                
                //2차 시도
                /*
                 Task1 queued
                 Task2 Done
                 Task2 queued
                 Task1 Done
                 */
                
                //3차 시도
                /*
                Task1 Done
                Task1 queued
                Task2 Done
                Task2 queued
                */
                
                //4차 시도
                /*
                 Task1 Done
                 Task1 queued
                 Task2 Done
                 Task2 queued
                 */
                
                //5차 시도
                /*
                 Task1 queued
                 Task1 Done
                 Task2 Done
                 Task2 queued
                 */
                
                //☝️여기도 무조건 task 2는 순서대로 나옴. 어쩌다가 Task1 Done이 Task2 Done과 Task2 queued 사이에 완료되서 들어갈 수 있겠지.
        
    }


}

