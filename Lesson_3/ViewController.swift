//
//  ViewController.swift
//  Lesson_3
//
//  Created by Denis Shpagin on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!

    @IBOutlet var getResultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResultButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.minimumValue = minimumValueLabel.text
        settingsVC.maximumValue = maximumValueLabel.text
    }

    @IBAction func getRandomNumberButtonTapped() {
        let minimumNumber = Int(String(minimumValueLabel.text ?? "")) ?? 0
        let maximumNumber = Int(String(maximumValueLabel.text ?? "")) ?? 100
        
        randomValueLabel.text = String(Int.random(in: minimumNumber...maximumNumber))
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        minimumValueLabel.text = settingsVC.minimumValueTF.text
        maximumValueLabel.text = settingsVC.maximumValueTF.text
    }
}

