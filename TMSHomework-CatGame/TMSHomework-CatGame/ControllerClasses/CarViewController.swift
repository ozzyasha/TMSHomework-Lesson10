//
//  CarViewController.swift
//  TMSHomework-CatGame
//
//  Created by Наталья Мазур on 24.12.23.
//

import UIKit
import SnapKit

class CarViewController: UIViewController {
    
    var carView: UIView!
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var obstaclesTimer: Timer?
    var isGameOver = false
    var lives = 3
    var livesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupCarView()
        setupStackView()
        startObstaclesTimer()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let bushLeft = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: view.bounds.height))
        bushLeft.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        scrollView.addSubview(bushLeft)
        
        let bushRight = UIView(frame: CGRect(x: view.bounds.width - 50, y: 0, width: 50, height: view.bounds.height))
        bushRight.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        scrollView.addSubview(bushRight)
    }
    
    func setupCarView() {
        carView = UIView(frame: CGRect(
            x: view.bounds.width/2 - 25,
            y: view.bounds.height - 100, width: 50, height: 80))
        carView.backgroundColor = .red
        scrollView.addSubview(carView)
    }
    
    func setupLivesLabel() {
        livesLabel = UILabel(frame: CGRect(
            x: 20,
            y: 50,
            width: 100,
            height: 30))
        livesLabel.text = "Lives: \(lives)"
        view.addSubview(livesLabel)
    }
    
    func setupStackView() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let leftButton = UIButton(type: .system)
        leftButton.setTitle("Left", for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        let rightButton = UIButton(type: .system)
        rightButton.setTitle("Right", for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    func startObstaclesTimer() {
        obstaclesTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(createObstacle), userInfo: nil, repeats: true)
    }
    
    func checkCollision(with obstacle: UIView) {
        if carView.frame.intersects(obstacle.frame) {
            gameOver()
        }
        
        if carView.frame.intersects(CGRect(x: 0, y: 0, width: 50, height: view.bounds.height)) ||
            carView.frame.intersects(CGRect(x: view.bounds.width - 50, y: 0, width: 50, height: view.bounds.height)) {
            lives -= 1
            livesLabel.text = "Lives: \(lives)"
            
            if lives <= 0 {
                gameOver()
            }
        }
    }
    
    
    @objc func createObstacle() {
        guard !isGameOver else { return }
        
        let randomX = CGFloat.random(in: 20...(view.bounds.width - 70))
        let obstacle = UIView(frame: CGRect(x: randomX, y: -50, width: 50, height: 50))
        obstacle.backgroundColor = .black
        scrollView.addSubview(obstacle)
        
        UIView.animate(withDuration: 5.0, delay: 0, options: .curveLinear, animations: {
            obstacle.frame.origin.y = self.view.bounds.height
        }, completion: { finished in
            obstacle.removeFromSuperview()
        })
        
        checkCollision(with: obstacle)
    }
    
    func gameOver() {
        isGameOver = true
        obstaclesTimer?.invalidate()
        
        let gameOverLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        gameOverLabel.text = "Game Over!"
        gameOverLabel.textAlignment = .center
        gameOverLabel.center = view.center
        view.addSubview(gameOverLabel)
    }
    
    
    @objc func leftButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.carView.frame.origin.x -= 50
        }
    }
    
    @objc func rightButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.carView.frame.origin.x += 50
        }
    }
    //    let headerStack = UIStackView()
    //    let roadScrollView = UIScrollView()
    //    let brokenDividingLine = UIStackView()
    //
    //    let healthLabel = UILabel()
    //    var healthScore = 3
    //    let timeLabel = UILabel()
    //    let wayScoreLabel = UILabel()
    //
    //    let line = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
    //
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    ////        view.addSubview(roadScrollView)
    //        view.addSubview(headerStack)
    //        setupHeaderStackConstraints()
    //
    //        setupHeaderStack()
    //
    //    }
    //
    //    func setupRoadScrollView() {
    //        roadScrollView.backgroundColor = UIColor.systemGray3
    //        roadScrollView.setContentOffset(CGPoint(x: 100, y: 100), animated: true)
    //    }
    //
    //    func setupBrokenDividingLine() {
    //        brokenDividingLine.axis = .vertical
    //        brokenDividingLine.spacing = 10
    //        brokenDividingLine.alignment = .center
    //
    //        brokenDividingLine.addArrangedSubview(line)
    //        brokenDividingLine.addArrangedSubview(line)
    //        brokenDividingLine.addArrangedSubview(line)
    //        brokenDividingLine.addArrangedSubview(line)
    //        brokenDividingLine.addArrangedSubview(line)
    //    }
    //
    //    func setupHeaderStack() {
    //
    //        switch healthScore {
    //        case 3:
    //            healthLabel.text = "Health: " + "❤️❤️❤️"
    //        case 2:
    //            healthLabel.text = "Health: " + "❤️❤️🩶"
    //        case 1:
    //            healthLabel.text = "Health: " + "❤️🩶🩶"
    //        default:
    //            healthLabel.text = "Health: " + "🩶🩶🩶"
    //        }
    //
    //        timeLabel.text = "Time: "
    //        wayScoreLabel.text = "Way Score: "
    //
    //        headerStack.axis = .horizontal
    //        headerStack.spacing = 20
    //        headerStack.alignment = .center
    //
    //        headerStack.addArrangedSubview(healthLabel)
    //        headerStack.addArrangedSubview(timeLabel)
    //        headerStack.addArrangedSubview(wayScoreLabel)
    //    }
    //
    //    func setupHeaderStackConstraints() {
    //        headerStack.snp.makeConstraints { make in
    //            make.leading.equalToSuperview().offset(30)
    //            make.top.equalToSuperview().offset(70)
    //        }
    //    }
}
