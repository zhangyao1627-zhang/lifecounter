//
//  playerView.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/20/24.
//

import UIKit

protocol PlayerViewDelegate: AnyObject {
    func didChangeScore(for playerView: PlayerView)
}

class PlayerView: UIView {
    
    var scoreLabel: UILabel
    var nameLabel: UILabel
    var scoreTextField: UITextField
    var plusButton: UIButton
    var minusButton: UIButton
    var player: Player
    
    weak var delegate: PlayerViewDelegate?
    
    init(player: Player) {
        self.player = player
        nameLabel = UILabel()
        scoreLabel = UILabel()
        scoreTextField = UITextField()
        plusButton = UIButton(type: .system)
        minusButton = UIButton(type: .system)
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = player.playerName
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        scoreLabel.text = "Score: \(player.score)"
        scoreLabel.textAlignment = .center
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scoreLabel)
        
        scoreTextField.placeholder = "Enter score"
        scoreTextField.borderStyle = .roundedRect
        scoreTextField.textAlignment = .center
        scoreTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scoreTextField)
        
        plusButton.addTarget(self, action: #selector(incrementScore), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decrementScore), for: .touchUpInside)
            
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = UIColor(red: 0.67, green: 0.84, blue: 0.9, alpha: 1.0)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.layer.cornerRadius = 5
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.black.cgColor
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(plusButton)
           
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .systemBlue
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.layer.cornerRadius = 5
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = UIColor.black.cgColor
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(minusButton)
        
        setupConstraints()
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
      
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
     
        NSLayoutConstraint.activate([
            scoreTextField.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 8),
            scoreTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            scoreTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        let buttonsContainer = UIView()
        buttonsContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonsContainer)
        
        buttonsContainer.addSubview(plusButton)
        buttonsContainer.addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            buttonsContainer.topAnchor.constraint(equalTo: scoreTextField.bottomAnchor, constant: 8),
            buttonsContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            buttonsContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            buttonsContainer.heightAnchor.constraint(equalToConstant: 44),
            buttonsContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: buttonsContainer.leadingAnchor),
            plusButton.topAnchor.constraint(equalTo: buttonsContainer.topAnchor),
            plusButton.bottomAnchor.constraint(equalTo: buttonsContainer.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            minusButton.leadingAnchor.constraint(equalTo: plusButton.trailingAnchor, constant: 8),
            minusButton.topAnchor.constraint(equalTo: buttonsContainer.topAnchor),
            minusButton.bottomAnchor.constraint(equalTo: buttonsContainer.bottomAnchor),
            minusButton.trailingAnchor.constraint(equalTo: buttonsContainer.trailingAnchor),
            minusButton.widthAnchor.constraint(equalTo: plusButton.widthAnchor)
        ])
    }

    
    @objc func incrementScore() {
        player.score += Int(scoreTextField.text ?? "0") ?? 0
//        print("add part")
//        print(scoreTextField.text)
        scoreLabel.text = "Score: \(player.score)"
        delegate?.didChangeScore(for: self)
    }
        
    @objc func decrementScore() {
        player.score -= Int(scoreTextField.text ?? "0") ?? 0
//        print("decrese part")
//        print(scoreTextField.text)
        scoreLabel.text = "Score: \(player.score)"
        delegate?.didChangeScore(for: self)
    }
    
    

}
