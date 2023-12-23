//
//  SecondViewController.swift
//  TMSHomework-Lesson10
//
//  Created by Наталья Мазур on 22.12.23.
//

import UIKit

class SecondViewController: UIViewController {

    var data: String?
    var screenNumber: Int?
    let dataButton = UIButton(type: .system)
    let screenLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dataButton)
        self.view.addSubview(screenLabel)
        
        setupButton()
        setupScreenLabel()
    }
    
    func setupButton() {
        dataButton.setTitle("Передать данные на третий экран", for: .normal)
        dataButton.backgroundColor = UIColor.systemGray6
        dataButton.layer.cornerRadius = 20
        dataButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        dataButton.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 270/2, y: 200, width: 270, height: 60)
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.black
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: Int(dataButton.frame.minY) - 80, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber!)"
    }
    
    @objc func sendData() {
        let storyboard = UIStoryboard(name: "ThirdViewController", bundle: nil)
        let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        thirdViewController.modalPresentationStyle = .fullScreen
        thirdViewController.data = self.data
        thirdViewController.screenNumber = self.screenNumber! + 1
        
        present(thirdViewController, animated: true)
    }
    

}
