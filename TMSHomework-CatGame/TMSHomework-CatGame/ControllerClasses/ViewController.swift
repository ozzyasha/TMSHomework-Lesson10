//
//  ViewController.swift
//  TMSHomework-CatGame
//
//  Created by Наталья Мазур on 23.12.23.
//
import UIKit

class ViewController: UIViewController {
    
    let buttonsVerticalStackView = UIStackView()
    let catButton = UIButton(type: .system)
    let squareButton = UIButton(type: .system)
    let carButton = UIButton(type: .system)
    let chooseGameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonsVerticalStackView)
        
        setupButtonsConstraints(button: catButton)
        setupButtonsConstraints(button: squareButton)
        setupButtonsConstraints(button: carButton)
        setupStackConstraints()
        
        setupButtons(button: catButton)
        setupButtons(button: squareButton)
        setupButtons(button: carButton)
        
        setupButtonsVerticalStackView()
        
        setupChooseGameLabel()
    }
    
    func setupChooseGameLabel() {
        chooseGameLabel.text = "Выберите игру:"
        chooseGameLabel.textColor = UIColor.systemBlue
        chooseGameLabel.font = UIFont(name: "Helvetica", size: 20)
    }
    
    func setupButtons(button: UIButton) {
        
        switch button {
        case catButton:
            catButton.setTitle("🐈 Игра для котиков", for: .normal)
            catButton.addTarget(self, action: #selector(goToCatGame), for: .touchUpInside)
        case squareButton:
            squareButton.setTitle("🟩🟨🟦 Квадраты", for: .normal)
            squareButton.addTarget(self, action: #selector(goToSquareGame), for: .touchUpInside)
        case carButton:
            carButton.setTitle("🏎️ Машинки", for: .normal)
            carButton.addTarget(self, action: #selector(goToCarGame), for: .touchUpInside)
        default:
            button.setTitle("No button", for: .normal)
        }
        
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 20
    }
    
    func setupButtonsVerticalStackView() {
        buttonsVerticalStackView.axis = .vertical
        buttonsVerticalStackView.spacing = 50
        buttonsVerticalStackView.alignment = .center
        
        buttonsVerticalStackView.addArrangedSubview(chooseGameLabel)
        buttonsVerticalStackView.addArrangedSubview(catButton)
        buttonsVerticalStackView.addArrangedSubview(squareButton)
        buttonsVerticalStackView.addArrangedSubview(carButton)
    }
    
    func setupStackConstraints() {
        buttonsVerticalStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupButtonsConstraints(button: UIButton) {
        button.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func goToCatGame() {
        let storyboard = UIStoryboard(name: "CatViewController", bundle: nil)
        let catVC = storyboard.instantiateViewController(withIdentifier: "CatViewController") as! CatViewController
        catVC.modalPresentationStyle = .fullScreen
        present(catVC, animated: true)
    }
    
    @objc func goToSquareGame() {
        let storyboard = UIStoryboard(name: "SquareViewController", bundle: nil)
        let squareVC = storyboard.instantiateViewController(withIdentifier: "SquareViewController") as! SquareViewController
        squareVC.modalPresentationStyle = .fullScreen
        present(squareVC, animated: true)
    }
    
    @objc func goToCarGame() {
        let storyboard = UIStoryboard(name: "CarViewController", bundle: nil)
        let carVC = storyboard.instantiateViewController(withIdentifier: "CarViewController") as! CarViewController
        carVC.modalPresentationStyle = .fullScreen
        present(carVC, animated: true)
    }
    
}

