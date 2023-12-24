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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupButtonsConstraints()

        setupSquareButton()
        
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
    
    func setupSquareButton() {
        squareButton.setTitle("Квадраты", for: .normal)
        
        squareButton.backgroundColor = UIColor.systemGray6
        squareButton.layer.cornerRadius = 20
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        squareButton.addTarget(self, action: #selector(squareButtonTapped), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubview(squareButton)

        view.addSubview(squareGreenView)
        view.addSubview(squareYellowView)
        view.addSubview(squareBlueView)
    }
    
    func setupButtonsConstraints() {
        squareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.size.height - 100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func squareButtonTapped() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let screenTop = Int(UIScreen.main.bounds.minY)
        let squareButtonTop = Int(squareButton.frame.minY)
        let squareSide = 70
        
        squareGreenView.isHidden = false
        repeat{
            squareGreenView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (screenTop + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareGreenView.frame.intersects(squareBlueView.frame) || squareGreenView.frame.intersects(squareYellowView.frame)
        
        squareYellowView.isHidden = false
        repeat {
            squareYellowView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (screenTop + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareYellowView.frame.intersects(squareGreenView.frame) || squareYellowView.frame.intersects(squareBlueView.frame)
        
        squareBlueView.isHidden = false
        repeat {
            squareBlueView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (screenTop + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareBlueView.frame.intersects(squareYellowView.frame) || squareBlueView.frame.intersects(squareGreenView.frame)
    }
}
