//
//  SquareViewController.swift
//  TMSHomework-CatGame
//
//  Created by Наталья Мазур on 24.12.23.
//

import UIKit
import SnapKit

class SquareViewController: UIViewController {

    let squareGreenView = UIView()
    let squareYellowView = UIView()
    let squareBlueView = UIView()
    
    let squareButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupButtonsConstraints()

        setupButtons(button: squareButton)
        setupButtons(button: backButton)
        
        setupSquareView(view: squareGreenView)
        setupSquareView(view: squareYellowView)
        setupSquareView(view: squareBlueView)
    }
    
    func setupSquareView(view: UIView) {
        switch view {
        case squareGreenView:
            squareGreenView.backgroundColor = UIColor.systemGreen
        case squareYellowView:
            squareYellowView.backgroundColor = UIColor.systemYellow
        case squareBlueView:
            squareBlueView.backgroundColor = UIColor.systemBlue
        default:
            view.backgroundColor = UIColor.clear
        }
        
        view.isHidden = true
    }
    
    func setupButtons(button: UIButton) {
        switch button {
        case squareButton:
            squareButton.setTitle("Квадраты", for: .normal)
            squareButton.addTarget(self, action: #selector(squareButtonTapped), for: .touchUpInside)
        case backButton:
            backButton.setTitle("Вернуться к выбору игры", for: .normal)
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        default:
            button.setTitle("No button", for: .normal)
        }
        
        button.backgroundColor = UIColor.systemGray6
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        view.addSubview(squareButton)

        view.addSubview(squareGreenView)
        view.addSubview(squareYellowView)
        view.addSubview(squareBlueView)
        
        view.addSubview(backButton)
    }
    
    func setupButtonsConstraints() {
        squareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(50)
        }
    }
    
    @objc func squareButtonTapped() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
//        let screenBottom = Int(UIScreen.main.bounds.maxY)
        let backButtonTop = Int(backButton.frame.minY)
        let squareButtonBottom = Int(squareButton.frame.maxY)
        let squareSide = 70
        
        squareGreenView.isHidden = false
        repeat{
            squareGreenView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (squareButtonBottom + squareSide)..<(backButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareGreenView.frame.intersects(squareBlueView.frame) || squareGreenView.frame.intersects(squareYellowView.frame)
        
        squareYellowView.isHidden = false
        repeat {
            squareYellowView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (squareButtonBottom + squareSide)..<(backButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareYellowView.frame.intersects(squareGreenView.frame) || squareYellowView.frame.intersects(squareBlueView.frame)
        
        squareBlueView.isHidden = false
        repeat {
            squareBlueView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (squareButtonBottom + squareSide)..<(backButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareBlueView.frame.intersects(squareYellowView.frame) || squareBlueView.frame.intersects(squareGreenView.frame)
    }
    
    @objc func backButtonTapped() {
        present(ViewController(), animated: true)
    }
}
