//
//  historyView.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/21/24.
//

import UIKit

class HistoryView: UIView {
    
    private var messageLabel: UILabel
    
    init(history: History) {
        messageLabel = UILabel()
        
        super.init(frame: .zero)
        messageLabel.text = history.message
        messageLabel.textAlignment = .center
        
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

