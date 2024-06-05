//
//  CarViewController.swift
//  TMSHomework-CatGame
//
//  Created by Наталья Мазур on 24.12.23.
//

import UIKit
import SnapKit

class CarViewController: UIViewController {
    
    let headerStackView = UIStackView()
    let roadView = UIView()
    let brokenDividingLine = UIStackView()
    
    let healthLabel = UILabel()
    var healthScore = 3
    let timeLabel = UILabel()
    let wayScoreLabel = UILabel()
    
    let backButton = UIButton(type: .system)
    
    let leftBush = UIImageView(image: UIImage(named: "bush"))
    let rightBush = UIImageView(image: UIImage(named: "bush"))
    let car = UIImageView(image: UIImage(named: "car"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubbviews()
        
        setupButtons(button: backButton)
        setupHeaderStackView()
        setupRoadView()
        setupBrokenDividingLine()
        
        setupConstraints()
        
    }
    
    func addSubbviews() {
        view.addSubview(roadView)
        view.addSubview(headerStackView)
        
        view.addSubview(backButton)
    }
    
    func setupRoadView() {
        roadView.backgroundColor = UIColor.systemGray3
        
        roadView.addSubview(brokenDividingLine)
        
        roadView.addSubview(leftBush)
        roadView.addSubview(rightBush)
//        roadView.addSubview(car)
        
    }
    
//    func setupBushes() {
//        
//    }
    
    func setupButtons(button: UIButton) {
        button.setTitle("Вернуться к выбору игры", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupBrokenDividingLine() {
        
        brokenDividingLine.axis = .vertical
        brokenDividingLine.spacing = 10
        brokenDividingLine.alignment = .center
        
        for _ in 1...10 {
            let line = UIView()
            
            line.snp.makeConstraints { make in
                make.width.equalTo(10)
                make.height.equalTo(50)
            }
            
            line.backgroundColor = UIColor.white
            brokenDividingLine.addArrangedSubview(line)
        }
    }
    
    func setupHeaderStackView() {
        
        switch healthScore {
        case 3:
            healthLabel.text = "Health: " + "❤️❤️❤️"
        case 2:
            healthLabel.text = "Health: " + "❤️❤️🩶"
        case 1:
            healthLabel.text = "Health: " + "❤️🩶🩶"
        default:
            healthLabel.text = "Health: " + "🩶🩶🩶"
        }
        
        timeLabel.text = "Time: "
        wayScoreLabel.text = "Way Score: "
        
        headerStackView.axis = .horizontal
        headerStackView.spacing = 20
        headerStackView.alignment = .center
        
        headerStackView.addArrangedSubview(healthLabel)
        headerStackView.addArrangedSubview(timeLabel)
        headerStackView.addArrangedSubview(wayScoreLabel)
    }
    
    
    func setupConstraints() {
        headerStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(50)
        }
        
        roadView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(20)
            make.bottom.equalTo(backButton.snp.top).offset(-20)
            make.width.equalToSuperview()
        }
        
        brokenDividingLine.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        leftBush.snp.makeConstraints { make in
            make.left.equalToSuperview()
        }
        
        rightBush.snp.makeConstraints { make in
            make.right.equalToSuperview()
        }
        
//        car.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
    }
    
    @objc func backButtonTapped() {
        present(ViewController(), animated: true)
    }
}
