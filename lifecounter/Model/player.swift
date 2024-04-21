//
//  player.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/20/24.
//

protocol GameDelegate: AnyObject {
    func gameDidEnd(dueTo player: Player)
}

class Player {
    var score: Int {
        didSet {
            scoreDidChange()
        }
    }
    var playerName: String
    weak var delegate: GameDelegate?
    
    init(score: Int, playerName: String) {
        self.score = score
        self.playerName = playerName
    }
    
    private func scoreDidChange() {
        if score < 0 {
            delegate?.gameDidEnd(dueTo: self)
        }
    }
}

