//
//  FirstViewController.swift
//  Homework 10
//
//  Created by Дмитрий Соколовский on 7.04.22.
//

import UIKit

class FirstViewController: UIViewController {
    
    var counter = 0

    // MARK: IBOutlet
    
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var heartHeight: NSLayoutConstraint!
    @IBOutlet weak var numberOfBeats: UIStepper!
    @IBOutlet weak var beatsOfDisplay: UITextField!
    @IBOutlet weak var start: UIButton!
    
    // MARK: IBAction
    
    @IBAction func numberOfBeatsAction(_ sender: UIStepper) {
        beatsOfDisplay.text = "Количество уд/мин: \(String(Int(numberOfBeats.value)))"
    }
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

       numberOfBeatsAction(numberOfBeats)
        
        start.addTarget(self, action: #selector(heartBeats), for: .touchUpInside)
    }
  
    // MARK: Override methods
    
    @objc
    private func heartBeats() {
        
        let duration = 60 / self.numberOfBeats.value
        
        UIView.animate(withDuration: duration, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.heartHeight.constant += 30
            self.view.layoutIfNeeded()
        }, completion: {_ in
            self.heartHeight.constant -= 30
            self.view.layoutIfNeeded()
            self.counter += 1
            if  (Double(self.counter) < Double(10) / duration) {
                self.heartBeats()
            } else {
                self.counter = 0
            }
        })
    }
}
