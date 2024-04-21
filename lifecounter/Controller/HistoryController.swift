//
//  HistoryController.swift
//  lifecounter
//
//  Created by Yao Zhang on 4/21/24.
//

import UIKit

class HistoryController: UIViewController {
   
    var historys:[HistoryView] = []
    @IBOutlet weak var historyScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        for historyView in historys {
            stackView.addArrangedSubview(historyView)
        }

 
        historyScrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: historyScrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: historyScrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: historyScrollView.contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: historyScrollView.contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: historyScrollView.frameLayoutGuide.widthAnchor)
        ])
    }

    
    func addHistoryView(_ historyView: HistoryView) {
        guard let stackView = historyScrollView.subviews.first as? UIStackView else { return }
        stackView.addArrangedSubview(historyView)
        historys.append(historyView)
    
        historyView.layoutIfNeeded()
        historyScrollView.layoutIfNeeded()
    }
    
    @IBAction func ReturnButton(_ sender: UIButton) {
        print("ReturnBack button pressed")
        self.dismiss(animated: true, completion: {
            print("Dismissal completed")
        })
    }
}
