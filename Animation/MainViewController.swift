//
//  ViewController.swift
//  Animation
//
//  Created by Nikolai Grachev on 08.11.2023.
//

import UIKit
import SpringAnimation

class MainViewController: UIViewController {
    
    @IBOutlet weak var presentView: SpringView!
    
    @IBOutlet weak var presetNameLabel: SpringLabel!
    @IBOutlet weak var curveNameLable: SpringLabel!
    @IBOutlet weak var forceNameLabel: SpringLabel!
    @IBOutlet weak var durationNameLabel: SpringLabel!
    @IBOutlet weak var delayNameLabel: SpringLabel!
    
    @IBOutlet weak var presetValueLabel: SpringLabel!
    @IBOutlet weak var curveValueLabel: SpringLabel!
    @IBOutlet weak var forceValueLabel: SpringLabel!
    @IBOutlet weak var durationValueLabel: SpringLabel!
    @IBOutlet weak var delayValueLabel: SpringLabel!
    
    @IBOutlet weak var runButton: SpringButton!
    
    private var defaultAnimationValues = Animation.getDefaultValues()
    
    private var copyOfModelActualAnimation: Animation!
    private var copyOfModelNextAnimation: Animation!
    
    private var nameLabels: [SpringLabel] = []
    private var valueLabels: [SpringLabel] = []
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabels = [presetNameLabel, curveNameLable, forceNameLabel, durationNameLabel, delayNameLabel]
        valueLabels = [presetValueLabel, curveValueLabel, forceValueLabel, durationValueLabel, delayValueLabel]
        startConditionView()
    }
    
    @IBAction func runButtonPressed() {
        changeAndAnimate()
    }
    
    private func startConditionView() {
        
        presetValueLabel.text = defaultAnimationValues.preset
        curveValueLabel.text = defaultAnimationValues.curve
        forceValueLabel.text = String(defaultAnimationValues.force)
        durationValueLabel.text = String(defaultAnimationValues.duration)
        delayValueLabel.text = String(defaultAnimationValues.delay)
        
        copyOfModelActualAnimation = Animation.getAnimation()
        copyOfModelActualAnimation = Animation.getAnimation()
    }
    
    private func changeAndAnimate() {
        
        presetValueLabel.text = copyOfModelActualAnimation.preset
        curveValueLabel.text = copyOfModelActualAnimation.curve
        forceValueLabel.text = String(copyOfModelActualAnimation.force)
        durationValueLabel.text = String(copyOfModelActualAnimation.duration)
        delayValueLabel.text = String( copyOfModelActualAnimation.delay)
        
        presentView.animation = copyOfModelActualAnimation.preset
        presentView.curve = copyOfModelActualAnimation.curve
        presentView.force = copyOfModelActualAnimation.force
        presentView.duration = copyOfModelActualAnimation.duration
        presentView.delay = copyOfModelActualAnimation.delay
        presentView.animate()
        
        let generalArray = nameLabels + valueLabels
        
        for label in generalArray {
            label.animation = copyOfModelActualAnimation.preset
            label.curve = copyOfModelActualAnimation.curve
            label.force = copyOfModelActualAnimation.force
            label.duration = copyOfModelActualAnimation.duration
            label.delay = copyOfModelActualAnimation.delay
            label.animate()
        }
        
        let newModel = Animation.getAnimation()
        
        copyOfModelNextAnimation = newModel
        runButton.setTitle(copyOfModelNextAnimation.preset, for: .normal)
        copyOfModelActualAnimation = copyOfModelNextAnimation
    }
}



