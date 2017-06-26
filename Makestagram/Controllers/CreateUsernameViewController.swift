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
import FirebaseAuth.FIRUser

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
    
    // whenever an user is created, a user JSON object will also be created for them within our database.
    // 1. First we guard to check that a FIRUser is logged in and that the user has provided a username in the text field.
    // 2. We create a dictionary to store the username the user has provided inside our database
    // 3. We specify a relative path for the location of where we want to store our data
    // 4. We write the data we want to store at the location we provided in step 3
    // 5. We read the user we just wrote to the database and create a user from the snapshot
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            
            print("Created new user: \(user.username)")
        }
    }
}
