//
//  SecondViewController.swift
//  Homework 10
//
//  Created by Дмитрий Соколовский on 7.04.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    let bounceSize: CGFloat = 150
    let defaultSpacing: CGFloat = 20
    
    // MARK: IBOutlet

    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var ball: UIImageView!
    
    // MARK: ViewDidLoad
   
    override func viewDidLoad() {
        super.viewDidLoad()
        start.addTarget(self, action: #selector(moving), for: .touchUpInside)
    }
    
    // MARK: Override methods
    
    @objc
    private func moving() {
        
        let width = Double(self.view.safeAreaLayoutGuide.layoutFrame.width) - 2 * defaultSpacing - bounceSize
        let height = Double(self.view.safeAreaLayoutGuide.layoutFrame.height) - 2 * defaultSpacing - bounceSize
        let horizontalDuration: TimeInterval = 1
        let verticalDuration: TimeInterval = horizontalDuration * height / width
        
        UIView.animate(withDuration: horizontalDuration, delay: 0, options: [.curveLinear], animations: {
            self.left.constant += width
            self.view.layoutIfNeeded()
        }, completion: {_ in UIView.animate(withDuration: verticalDuration, delay: 0, options: [.curveLinear], animations: {
                 self.top.constant += height
                 self.view.layoutIfNeeded()
            }, completion: {_ in UIView.animate(withDuration: horizontalDuration, delay: 0, options: [.curveLinear], animations: {
                     self.left.constant -= width
                     self.view.layoutIfNeeded()
                }, completion: {_ in UIView.animate(withDuration: verticalDuration, delay: 0, options: [.curveLinear], animations: {
                          self.top.constant -= height
                          self.view.layoutIfNeeded()
                   }, completion: {_ in self.moving()
                       
                   })
       
                })
        
            })
        
        })
    
    }

}
