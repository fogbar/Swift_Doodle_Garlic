//
//  FirstScreen.swift
//  signInGoogleProgrammatically
//
//  Created by garlic on 2020/08/05.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class FirstScreen: UIViewController {
    
    var nextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.setTitle("NEXT", for: .normal)
        button.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(nextButton)
        setUpNextButtonConstraints()
        
    }
    
    @objc func nextBtnTapped() {
        let nextScreen = SecondScreen()
        nextScreen.title = "Ahhhh Yeah"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    func setUpNextButtonConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
    }


}
