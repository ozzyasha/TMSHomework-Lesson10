//
//  CatViewController.swift
//  TMSHomework-CatGame
//
//  Created by Наталья Мазур on 24.12.23.
//

import UIKit
import SnapKit

class CatViewController: UIViewController {
    
    let circleView = UIView()

    let upButton = UIButton(type: .system)
    let downButton = UIButton(type: .system)
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupButtonsConstraints()
        
        setupButtons(button: upButton)
        setupButtons(button: downButton)
        setupButtons(button: leftButton)
        setupButtons(button: rightButton)
        
        setupCircleView()
    }
    
    func setupCircleView() {
        let viewCenterX = Int(view.center.x)
        let viewCenterY = Int(view.center.y)
        let circleSide = 50
        
        let frameCircle = CGRect(x: viewCenterX - circleSide / 2, y: viewCenterY - circleSide / 2, width: circleSide, height: circleSide)
        
        circleView.backgroundColor = UIColor.systemRed
        circleView.frame = frameCircle
        circleView.layer.cornerRadius = circleView.bounds.size.width / 2
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(circleViewTapped))
        circleView.addGestureRecognizer(gesture)
    }
    
    func setupButtons(button: UIButton) {
        switch button {
        case upButton:
            button.setTitle("👆", for: .normal)
            button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        case downButton:
            button.setTitle("👇", for: .normal)
            button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        case leftButton:
            button.setTitle("👈", for: .normal)
            button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        case rightButton:
            button.setTitle("👉", for: .normal)
            button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        default:
            button.setTitle("No button", for: .normal)
        }
        
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        view.addSubview(circleView)
        
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }
    
    func setupButtonsConstraints() {
        upButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(UIScreen.main.bounds.size.width / 4 - 50)
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        downButton.snp.makeConstraints { make in
            make.left.equalTo(upButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(downButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        rightButton.snp.makeConstraints { make in
            make.left.equalTo(leftButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func circleViewTapped() {
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let upButtonBottom = Int(upButton.frame.maxY)
        let safeAreaBottom = Int(view.safeAreaLayoutGuide.layoutFrame.size.height)
        
        let circleSide = Int(circleView.bounds.size.width)
        
        circleView.frame = CGRect(x: Int.random(in: 1..<(safeAreaWidth - circleSide)), y: Int.random(in: (upButtonBottom + circleSide)..<(safeAreaBottom - circleSide)), width: circleSide, height: circleSide)
    }
    
    @objc func upButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleTop > Int(upButton.frame.maxY + 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop - 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func downButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleBottom = Int(circleView.frame.maxY)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleBottom < Int(view.safeAreaLayoutGuide.layoutFrame.size.height - 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop + 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func leftButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleLeft > 10 {
            circleView.frame = CGRect(x: circleLeft - 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
    @objc func rightButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleRight = Int(circleView.frame.maxX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleRight < Int(UIScreen.main.bounds.size.width) - 10 {
            circleView.frame = CGRect(x: circleLeft + 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
}

