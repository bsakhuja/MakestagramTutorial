//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Brian Sakhuja on 6/26/17.
//  Copyright © 2017 Brian Sakhuja. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    // MARK: - Subviews
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBActions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // create new user in database
    }
    
    
}
