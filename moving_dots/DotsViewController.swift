//
//  DotsViewController.swift
//  moving_dots
//
//  Created by Deniz Nessa on 11/7/23.
//

import UIKit

class DotsViewController: UIViewController {
    
    @IBOutlet private weak var redDot: DotView!
    @IBOutlet private weak var dotMover: UIStepper!
    @IBOutlet private weak var dotStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureStepper()
    }
    
    private func configureStepper() {
        dotMover.setDecrementImage(UIImage(systemName: "chevron.left"), for: .normal)
        dotMover.setIncrementImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        dotMover.maximumValue = Double(dotStack.subviews.count - 1) //because we start at index 0
    }

    @IBAction
    private func didModifyStepper(_ sender: UIStepper) {
        let currentValue = Int(sender.value)
        UIView.animate(withDuration: 0.4, animations: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dotStack.removeArrangedSubview(strongSelf.redDot)
            strongSelf.dotStack.insertArrangedSubview(strongSelf.redDot, at: currentValue)
            strongSelf.dotStack.layoutIfNeeded()
        })
    }

}

