//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Brian Sakhuja on 6/23/17.
//  Copyright © 2017 Brian Sakhuja. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

//typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    typealias FIRUser = FirebaseAuth.User
    
    // MARK: - Properties
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // access the FUIAuth default auth UI singleton
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // set FUIAuth's singleton delegate
        authUI.delegate = self
        
        // present the auth view controller
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        
        // First we check that the FIRUser returned from authentication is not nil by unwrapping it. We guard this statement, because we cannot proceed further if the user is nil. We need the FIRUser object's uid property to build the relative path for the user at /users/#{uid}.
        guard let user = user
            else { return }
        
        // We construct a relative path to the reference of the user's information in our database
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // We read from the path we created and pass an event closure to handle the data (snapshot) is passed back from the database.
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            let user = User(snapshot: snapshot)
            
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
                print("New user!")
            }
        })
    }
}

