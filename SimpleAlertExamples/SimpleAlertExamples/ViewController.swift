//
//  ViewController.swift
//  SimpleAlertExamples
//
//  Created by Daniel Carmo on 2018-08-24.
//  Copyright © 2018 DMCApps. All rights reserved.
//

import UIKit
import SimpleAlert

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet var numberOfButtonsButton: UIButton!
    @IBOutlet var simpleAlertNumberOfButtonsStandardIf: UIButton!
    @IBOutlet var simpleAlertNumberOfButtonsBuiltinIf: UIButton!
    
    private var numberOfButtons: Int = 1
    
    // MARK: Object Lifecycle
    
    // MARK: View Lifecycle
    
    // MARK: Segues
    
    // MARK: Accessors
    
    // MARK: Actions
    
    @IBAction func SimpleAlert1(_ sender: UIButton) {
        self.alert.with(
            .title("New Alert"),
            .message("This is a new style Alert."),
            .action(.default("Option 1"), { action in
                self.didClickOption1()
            }),
            .action(.default("Option 2"), { action in
                self.didClickOption2()
            }),
            .action(.destructive("Option 3"), { action in
                self.didClickOption3()
            }),
            .action(.cancel("Cancel"), nil)
            )
            .show()
    }
    
    @IBAction func clickedNumberOfButtons(_ sender: UIButton) {
        numberOfButtons += 1
        if numberOfButtons > 3 {
            numberOfButtons = 1
        }
        
        numberOfButtonsButton.setTitle("Number of Buttons: \(numberOfButtons)", for: .normal)
        simpleAlertNumberOfButtonsStandardIf.setTitle("Simple Alert With \(numberOfButtons) Button Standard if", for: .normal)
        simpleAlertNumberOfButtonsBuiltinIf.setTitle("Simple Alert With \(numberOfButtons) Button Built-in if", for: .normal)
    }
    
    @IBAction func SimpleAlertForNumberOfButtonsStandardIf(_ sender: UIButton) {
        let alertBuilder = self.alert.with(
            .title("New Alert"),
            .message("This is a new style Alert.")
            )
        
        if numberOfButtons > 0 {
            let _ = alertBuilder.with(.action(.default("Option 1"), { _ in
                self.didClickOption1()
            }))
        }
        
        if numberOfButtons > 1 {
            let _ = alertBuilder.with(.action(.default("Option 2"), { _ in
                self.didClickOption2()
            }))
        }
        
        if numberOfButtons > 2 {
            let _ = alertBuilder.with(.action(.destructive("Option 3"), { _ in
                self.didClickOption3()
            }))
        }
        
        let _ = alertBuilder.with(.action(.cancel("Cancel"), nil))
        
        alertBuilder.show()
    }
    
    @IBAction func SimpleAlertForNumberOfButtonsBuiltinIf(_ sender: UIButton) {
        self.alert.with(
            .title("New Alert"),
            .message("This is a new style Alert."),
            .action(.default("Option 1"), { _ in
                self.didClickOption1()
            }),
            .action(.default("Option 2"), { _ in
                self.didClickOption2()
            }),
            .action(.destructive("Option 3"), { _ in
                self.didClickOption3()
            }),
            .action(.cancel("Cancel"), nil)
            )
            .show()
    }
    
    @IBAction func SimpleStyleSheet1(_ sender: UIButton) {
        self.alert.with(
            .style(.actionSheet),
            .title("Style Sheet 1."),
            .message("This is a Style Sheet"),
            .action(.default("Option 1"), { _ in
                self.didClickOption1()
            }),
            .action(.default("Option 2"), { _ in
                self.didClickOption2()
            }),
            .action(.destructive("Option 3"), { _ in
                self.didClickOption3()
            }),
            .action(.cancel("Cancel"), nil)
            )
            .show()
    }
    
    // MARK: Public
    
    // MARK: Internal
    
    // MARK: Private
    
    private func didClickOption1() {
        self.alert.with(
            .title("Option 1"),
            .action(.default("OK"), nil)
            )
            .show()
    }
    
    private func didClickOption2() {
        self.alert.with(
            .title("Option 2"),
            .action(.default("OK"), nil)
            )
            .show()
    }
    
    private func didClickOption3() {
        self.alert.with(
            .title("Delete Something!"),
            .action(.default("OK"), nil)
            )
            .show()
    }
    
    // MARK: <NameOfProtocol>
    
}

