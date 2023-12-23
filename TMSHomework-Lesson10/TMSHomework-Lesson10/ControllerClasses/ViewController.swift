//
//  ViewController.swift
//  TMSHomework-Lesson10
//
//  Created by Наталья Мазур on 20.12.23.
//

import UIKit

class ViewController: UIViewController {

    let data = "Переданные данные"
    let screenNumber = 1
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
        dataButton.setTitle("Передать данные на второй экран", for: .normal)
        dataButton.backgroundColor = UIColor.systemGray6
        dataButton.layer.cornerRadius = 20
        dataButton.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        dataButton.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 270/2, y: 200, width: 270, height: 60)
    }
    
    func setupScreenLabel() {
        screenLabel.textColor = UIColor.black
        screenLabel.frame = CGRect(x: Int(UIScreen.main.bounds.size.width/2) - 100/2, y: Int(dataButton.frame.minY) - 80, width: 100, height: 60)
        screenLabel.text = "Экран №\(screenNumber)"
    }
    
    @objc func sendData() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = self.data
        secondViewController.screenNumber = self.screenNumber + 1
        
        present(secondViewController, animated: true)
    }

}

