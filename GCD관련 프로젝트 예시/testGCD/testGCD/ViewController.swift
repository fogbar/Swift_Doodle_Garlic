//
//  ViewController.swift
//  testGCD
//
//  Created by garlic on 2020/05/26.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        simpleQueues()
    }
    
    func simpleQueues() {
        
        //--------------------------------------------------------------------------------------------
        
        
        //let queue = DispatchQueue(label: "uniqueLabel") //--> custom Queue는 기본적으로 Serial
        
        //1. 둘다 sync
        //1의 결과 : 그냥 순서대로 쭉 나옴. 위에거 먼저 실행, 그 후에 아랫놈 실행
        //                 queue.sync {
        //                     for i in 0..<100 {
        //                         print("🤖", i)
        //                     }
        //                 }
        //
        //                 queue.sync {
        //                     for i in 100..<200 {
        //                         print("Ⓜ️", i)
        //                     }
        //                 }
        
        
        //2. 둘다 async
        //2의 결과 : 얘도 1과 똑같이 순서대로 나옴.
        //                 queue.async {
        //                     for i in 0..<100 {
        //                         print("🤖", i)
        //                     }
        //                 }
        //
        //                 queue.async {
        //                     for i in 100..<200 {
        //                         print("Ⓜ️", i)
        //                     }
        //                 }
        
        //3. 위만 async
        //3의 결과 : 얘도 1,2와 똑같음... --> 바로 아래 코드 처럼 DispatchQueue.main.async와 DispatchQueue.main.sync에 넣고 똑같이 해보면 무조건 아래 놈이 먼저 출력되는데 왜 custom Queue에서는 그렇게 되지 않지?
//                         queue.async {
//                             for i in 0..<100 {
//                                 print("🤖", i)
//                             }
//                         }
//
//                         queue.sync {
//                             for i in 100..<200 {
//                                 print("Ⓜ️", i)
//                             }
//                         }
        /*
        DispatchQueue.main.async {
            
            for i in 0..<100 {
                print("🤖", i)
            }
        }
            for i in 100..<200 {
                print("Ⓜ️", i)
            }
            */
            
            //4. 아래만 async
            //4의 결과 : 얘도 1, 2, 3과 똑같음
            //                 queue.sync {
            //                     for i in 0..<100 {
            //                         print("🤖", i)
            //                     }
            //                 }
            //
            //                 queue.async {
            //                     for i in 100..<200 {
            //                         print("Ⓜ️", i)
            //                     }
            //                 }
            
            //☝️이놈들이 모두 1, 2, 3과 똑같은 이유
            // 이유 1. queue가 작업들을 순서대로 처리하는 Serial Queue임.
            // 이유 2. 따라서
            
            
            
            //-------------------------------------------------------------------------------------------
            
            //혹시 몰라 concurrent로 돌려봄
            //let queue = DispatchQueue(label: "uniqueLabel", attributes: .concurrent)
            
            
            //어떤때는 queue의 놈이 먼저 실행되고 어떤때는 main의 놈이 먼저 실행되네... 어쩔땐 섞여 나오고... 이건 cpu가 업무를 어떻게 배분하는지에 따라 달라지는 것인 것 같다...
            //1. 둥다 sync
            //1의 결과 : Serial일때의 1번과 결과가 똑같음.
            //        queue.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            
            //2. 둘다 async
            //2의 결과 : 1번과 같이 나올때도 있지만, 얘의 경우 비동기적으로도 나옴.
            //        queue.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //3. 위만 async
            //3의 결과 : 얘의 경우도 2번과 같음.
            //        queue.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //4. 아래만 async -> 10번 정도 돌려봄..
            //4의 결과 : 얘는 1번과 같음
            //        queue.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            
            
            //--------------------------------------------------------------------------------------------
            
            //큐가 두개일 경우 --> 둘다 Serial
            //        let queue1 = DispatchQueue(label: "qaz")
            //        let queue2 = DispatchQueue(label: "wsx")
            /* queue3는 그냥 테스트를 위한 것
             //        let queue3 = DispatchQueue(label: "edc")
             */
            //1. 큐1, 큐2 모두 sync
            //1-결과: 모두 순서대로 나옴. -> 참고로 모두 순서대로라는 말은 큐 1번 후에 큐 2번이 실행된다는 말.
            //        queue1.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //2. 큐1, 큐2 모두 async
            //2-결과: 비동기처리를 한 것 처럼 섞여서 나옴. 참고로 어떤게 먼저 실행될지는 모름.
            //        queue1.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //3.큐 1은 Sync, 큐2는 async
            //3-결과 : 모두 순서대로 나옴, (1번과 같음)
            //        queue1.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //4. 큐1은 async, 큐2는 sync
            //4-결과 : 비동기 처리 한 것 처럼 나옴. (큐1이 먼저 나올지 큐 2가 먼저 나올지는 모름.)
            //이유: queue1이 비동기로 처리를 하기 때문에 다음 queue2에서 처리할 작업 들을 바로 실행을 해버림. 그러다보니 queue1이 실행되는 동안 queue2도 실행이 되는 거임. 그런데 만약 queue3가 하나 더 있고 그게 queue2아래에 비동기로 들어온다라고 하면 queue3는 queue2가 다 완료되고 난 뒤에 나오게 되겠지. --> 추론 (오케이 queue3 하나 더 만들어서 실험해본 결과 맞다는게 증명됨)
            //        queue1.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            //
            /* 이놈은 그냥 테스트를 위한 것
             //        queue3.async{
             //            for i in 100..<200 {
             //                print("💥", i)
             //            }
             //        }
             */
            
            //--------------------------------------------------------------------------------------------
            
            //어찌됐든 큐는 FIFO라서 모든 작업들이 순서대로 실행되는 거! --> 이건 모두 경우에 공통!
            
            //큐가 두개일 경우 --> 둘다 Concurrent
            //        let queue1 = DispatchQueue(label: "qaz", attributes: .concurrent)
            //        let queue2 = DispatchQueue(label: "wsx", attributes: .concurrent)
            
            //1. 큐1, 큐2 모두 sync
            //1-결과: 모두 순서대로 나옴. -> 참고로 모두 순서대로라는 말은 큐 1번 후에 큐 2번이 실행된다는 말.
            //이렇게 되는 이유 : Concurrent라 각 큐에서 다른 쓰레드로 task들을 알아서 분할시키기는 하지만 모두 sync라서 다른 쓰레드로 보낸 task들이 완료되어 다시 돌아올 떄까지 기다리기 때문.
            //        queue1.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //2. 큐1, 큐2 모두 async
            //2-결과: 누가 먼저 프린트되는지는 아무도 모름. 큐끼리 경쟁함. 비동기적으로 처리 됨. 심지어 Concurrent라 다른 쓰레드로 업무들이 보내지는데 async라 기다리지도 않고 다음 업무를 실행해보려서
            //이렇게 되는 이유: Concurrent라 각 큐에서 다른 쓰레드로 task들을 알아서 분할시키는데 그 분할시킨 업무가 끝날떄까지 기다리지 않고 그냥 다음 업무를 수행을 해버림. 그래서 다른 쓰레드의 업무들이 다 끝날떄까지 기다리는게 아니라 그냥 바로 리턴을 해버리기 때문에 각자 완료가 되는대로 리턴을 시켜버림. 그래서 되는 것.
            //        queue1.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //3. 큐1은 sync, 큐2는 async
            //3-결과: 얘도 1번과 같이 모두 순서대로 나옴. --> 왜 얘는 1번하고 똑같이 나오고 아래 4번은 비동기 한 것처럼 나오는거지....?
            //이렇게 되는 이유:
            //        queue1.sync {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.async {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            //4. 큐1은 async 큐2는 sync
            //4-결과: 얘는 2번과 같이 나옴. 비동기 처리되어서 나옴...
            //이렇게 된 이유:
            //        queue1.async {
            //            for i in 0..<100 {
            //                print("🤖", i)
            //            }
            //        }
            //
            //        queue2.sync {
            //            for i in 100..<200 {
            //                print("Ⓜ️", i)
            //            }
            //        }
            
            
            //지금 내 추측 상으로는 async는 정말 다음 업무를 동시에 실행하도록 하는데 sync는 끝날떄까지 기다려야 함. 이 말은 쉽게 설명하자면 바로 위에 4번 코드로 예를 들어보겠음. queue1이 비동기이기 때문에 그 다음 업무인 queue2.sync가 동시에 처리되게 되는 것임. --> 그러면 여기서 궁금한 점은 어디에서 비동기적으로 실행되고 어디에서 동기적으로 실행되어야 하는지 순서도 중요해지는 것인가? 아.. 그래서 URLSession이 비동기 처리라고 하는 것이 URLSession에서 해야하는 작업이 다 끝나지 않았더라도 그냥 다른 작업 들을 동시에 하도록 하는 것이고만.
            
            //--------------------------------------------------------------------------------------------
            
            //하나는 Serial, 하나는 Concurrent
            //        let queue1 = DispatchQueue(label: "rfv")
            //        let queue2 = DispatchQueue(label: "tgb", attributes: .concurrent)
            //
            //            //1. 큐1, 큐2 모두 sync
            //            //1-결과: 모두 순서대로 나옴. -> 참고로 모두 순서대로라는 말은 큐 1번 후에 큐 2번이 실행된다는 말.
            //            //이렇게 되는 이유 : Concurrent라 각 큐에서 다른 쓰레드로 task들을 알아서 분할시키기는 하지만 모두 sync라서 다른 쓰레드로 보낸 task들이 완료되어 다시 돌아올 떄까지 기다리기 때문.
            //            queue1.sync {
            //                for i in 0..<100 {
            //                    print("🤖", i)
            //                }
            //            }
            //
            //            queue2.sync {
            //                for i in 100..<200 {
            //                    print("Ⓜ️", i)
            //                }
            //            }
            
            //실상적으로 serial과 concurrent를 다르게 해서 비교하는 것은 별로 큰 문제가 되지 않는 것 아닌가? 왜냐하면 그냥 일 처리를 다른데로 뿌려주는지 아닌지만 판단하는 거잖아. 짜피 지금 내가 테스트하는 것은 sync와 async의 차이만 알기위한 것 아닌가? serial 큐의 경우 하나의 쓰레드에서 처리를 해서 느린 것인 반면 concurrent 큐는 그냥 여러 쓰레드로 분산시켜서 처리하는 것이니깐. 효율만 따지는거 아닌가? Serial과 concurrent는?
            //그래서 효율적인 면만 보면 concurrent queue가 Serial보다 더 좋아보이는데 Serial Queue는 왜 쓰는 걸까??
            //이유 : 각자의 쓰임이 다르기 때문이다.
            //Serail 큐는 순서가 중요한 작업들을 처리할때 사용
            //Concurrent 큐는 각자 독립적이지만 중요도나 작업의 성격 등이 유사한 여러개의 작업을 처리할때 사용
            //main queue와 main thread는 다름
            
            
            
            
            
            
            //                DispatchQueue.global().sync {
            //                    print("1")
            //                }
            //
            //                print("2")
            //
            //                DispatchQueue.global().sync {
            //                    sleep(2)
            //                    print("3")
            //                }
            //
            //                //4, 5, 6, 7은 모두 async라 누가 먼저 나오는지는 알 수 없음. 그냥 처리되는 대로 먼저 나오게 됨.다만 7은 무조건 4보다 뒤에 나옴. 왜냐면 main queue는 Serail이기 때문.
            //                DispatchQueue.main.async {
            //                    print("4")
            //                }
            //
            //                DispatchQueue.global().async {
            //                    print("5")
            //                }
            //
            //                DispatchQueue.global().async {
            //                    print("6")
            //                }
            //
            //                DispatchQueue.main.async {
            //                    print("7")
            //                }
        
        //👇코더스하이 포럼에 올린 내용
        
        
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
        
        //--------------------------------------------------------------------------------------------
        
        //GCD 예시
        
        
        
        
        
        
        
        }
        
        
        
        
        
        
}
