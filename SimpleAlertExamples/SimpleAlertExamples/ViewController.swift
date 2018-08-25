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
    
    // MARK: Object Lifecycle
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Segues
    
    // MARK: Accessors
    
    // MARK: Actions
    
    @IBAction func oldSchoolAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Old Alert", message: "This is an old style alert.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func SimpleAlert1(_ sender: UIButton) {
        self.alert.with(
            .title("New Alert"),
            .message("This is a new style Alert."),
            .action(.default("OK"), nil),
            .action(.cancel("Cancel"), nil)
        )
        .show()
    }
    
    // MARK: Public
    
    // MARK: Internal
    
    // MARK: Private
    
    // MARK: <NameOfProtocol>
    
}

