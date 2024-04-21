//
//  MainController.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/20/24.
//

import UIKit

class MainController: UIViewController, PlayerViewDelegate, GameDelegate {
    
    
    @IBOutlet weak var ContentScrollView: UIScrollView!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var HistoryButton: UIButton!
    
    var playerCount = 0
    var playerViews: [PlayerView] = []
    var historys: [HistoryView] = []
    let stackView = UIStackView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        addNewViewToStackView()
        addNewViewToStackView()
        addNewViewToStackView()
        addNewViewToStackView()
    }
    
    func setupStackView() {
        ContentScrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: ContentScrollView.contentLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: ContentScrollView.contentLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: ContentScrollView.contentLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: ContentScrollView.contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: ContentScrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        if (playerCount > 7) {
            return
        }
        addNewViewToStackView()
    }
    
    @IBAction func GoHistory(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHistory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHistory" {
            let destinationVC = segue.destination as! HistoryController
            destinationVC.historys = historys
        }
    }
    
    func addNewViewToStackView() {
        playerCount += 1
        
        let playerName = "Player\(playerCount)"
        let player = Player(score: 20, playerName: playerName)
        let playerView = PlayerView(player: player)
        
        stackView.addArrangedSubview(playerView)
                
        NSLayoutConstraint.activate([
            playerView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 250)
        ])

        playerViews.append(playerView)
        player.delegate = self
        playerView.delegate = self
    }
    
    func didChangeScore(for playerView: PlayerView) {
        AddButton?.isEnabled = false
    }
    
    func gameDidEnd(dueTo player: Player) {
       // 弹出警告窗口
       let alert = UIAlertController(title: "Game Over", message: "\(player.playerName) lost the game!", preferredStyle: .alert)
       let history = History(message: "\(player.playerName) lost the game!")
       let historyView = HistoryView(history: history)
       historys.append(historyView)
       let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           // 用户点击了OK，重置游戏
           self.resetGame()
       }
       alert.addAction(okAction)
       present(alert, animated: true)
    }
   
    func resetGame() {
        for playerView in playerViews {
            playerView.removeFromSuperview()
        }
        playerViews.removeAll()
        playerCount = 0
        
        
        AddButton?.isEnabled = true
    }
    
}
