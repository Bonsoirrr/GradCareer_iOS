//
//  accountViewController.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/12/22.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class accountViewController: UIViewController {
    // create container for textField
    let UserNameContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    let UserNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter user name"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var UserNameTextFieldHeightAnchor: NSLayoutConstraint?
    var UserNameContainerViewHeightAnchor: NSLayoutConstraint?
    
    func setupUserNameView() {
        // need location of the box: x, y, width, height
        UserNameContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UserNameContainerView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        UserNameContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -36).isActive = true
        UserNameContainerViewHeightAnchor = UserNameContainerView.heightAnchor.constraint(equalToConstant: 40)
        UserNameContainerViewHeightAnchor?.isActive = true
        
        // add TextField
        UserNameContainerView.addSubview(UserNameTextField)

        // need location of the box: x, y, width, height
        UserNameTextField.leftAnchor.constraint(equalTo: UserNameContainerView.leftAnchor, constant: 12).isActive = true
        UserNameTextField.topAnchor.constraint(equalTo: UserNameContainerView.topAnchor).isActive = true
        UserNameTextField.widthAnchor.constraint(equalTo: UserNameContainerView.widthAnchor).isActive = true
        UserNameContainerViewHeightAnchor = UserNameTextField.heightAnchor.constraint(equalTo: UserNameContainerView.heightAnchor)
        
        UserNameContainerViewHeightAnchor?.isActive = true
    }
    
    // create container for textField
    let UniversityContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    let UniversityTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter university"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var UniversityTextFieldHeightAnchor: NSLayoutConstraint?
    var UniversityContainerViewHeightAnchor: NSLayoutConstraint?
    
    func setupUniversityView() {
        // need location of the box: x, y, width, height
        UniversityContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UniversityContainerView.centerYAnchor.constraint(equalTo: UserNameTextField.centerYAnchor, constant: 64).isActive = true
        UniversityContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -36).isActive = true
        UniversityContainerViewHeightAnchor = UniversityContainerView.heightAnchor.constraint(equalToConstant: 40)
        UniversityContainerViewHeightAnchor?.isActive = true
        
        // add TextField
        UniversityContainerView.addSubview(UniversityTextField)
        
        // need location of the box: x, y, width, height
        UniversityTextField.leftAnchor.constraint(equalTo: UserNameContainerView.leftAnchor, constant: 12).isActive = true
        UniversityTextField.topAnchor.constraint(equalTo: UniversityContainerView.topAnchor).isActive = true
        UniversityTextField.widthAnchor.constraint(equalTo: UniversityContainerView.widthAnchor).isActive = true
        UniversityContainerViewHeightAnchor = UniversityTextField.heightAnchor.constraint(equalTo: UniversityContainerView.heightAnchor)
        
        UniversityContainerViewHeightAnchor?.isActive = true
    }
    
    // create container for textField
    let MajorContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    let MajorTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter major"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    var MajorTextFieldHeightAnchor: NSLayoutConstraint?
    var MajorContainerViewHeightAnchor: NSLayoutConstraint?
    
    func setupMajorView() {
        // need location of the box: x, y, width, height
        MajorContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        MajorContainerView.centerYAnchor.constraint(equalTo: UniversityTextField.centerYAnchor, constant: 64).isActive = true
        MajorContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -36).isActive = true
        MajorContainerViewHeightAnchor = MajorContainerView.heightAnchor.constraint(equalToConstant: 40)
        MajorContainerViewHeightAnchor?.isActive = true
        
        // add TextField
        MajorContainerView.addSubview(MajorTextField)
        
        // need location of the box: x, y, width, height
        MajorTextField.leftAnchor.constraint(equalTo: UserNameContainerView.leftAnchor, constant: 12).isActive = true
        MajorTextField.topAnchor.constraint(equalTo: MajorContainerView.topAnchor).isActive = true
        MajorTextField.widthAnchor.constraint(equalTo: MajorContainerView.widthAnchor).isActive = true
        MajorContainerViewHeightAnchor = MajorTextField.heightAnchor.constraint(equalTo: MajorContainerView.heightAnchor)
        
        MajorContainerViewHeightAnchor?.isActive = true
    }
    
    // create container for textField
    let JobContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
         
    let JobTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter job title"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var JobTextFieldHeightAnchor: NSLayoutConstraint?
    var JobContainerViewHeightAnchor: NSLayoutConstraint?
    
    func setupJobView() {
        // need location of the box: x, y, width, height
        JobContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        JobContainerView.centerYAnchor.constraint(equalTo: MajorTextField.centerYAnchor, constant: 64).isActive = true
        JobContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -36).isActive = true
        JobContainerViewHeightAnchor = JobContainerView.heightAnchor.constraint(equalToConstant: 40)
        JobContainerViewHeightAnchor?.isActive = true
        
        // add TextField
        JobContainerView.addSubview(JobTextField)
        
        // need location of the box: x, y, width, height
        JobTextField.leftAnchor.constraint(equalTo: UserNameContainerView.leftAnchor, constant: 12).isActive = true
        JobTextField.topAnchor.constraint(equalTo: JobContainerView.topAnchor).isActive = true
        JobTextField.widthAnchor.constraint(equalTo: JobContainerView.widthAnchor).isActive = true
        JobContainerViewHeightAnchor = JobTextField.heightAnchor.constraint(equalTo: JobContainerView.heightAnchor)
        
        JobContainerViewHeightAnchor?.isActive = true
    }
    
    // create container for textField
    let LocationContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()

    let LocationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter location"
        tf.layer.cornerRadius = 8
        tf.backgroundColor = .white
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var LocationTextFieldHeightAnchor: NSLayoutConstraint?
    var LocationContainerViewHeightAnchor: NSLayoutConstraint?
    
    func setupLocationView() {
        // need location of the box: x, y, width, height
        LocationContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LocationContainerView.centerYAnchor.constraint(equalTo: JobTextField.centerYAnchor, constant: 64).isActive = true
        LocationContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -36).isActive = true
        LocationContainerViewHeightAnchor = LocationContainerView.heightAnchor.constraint(equalToConstant: 40)
        LocationContainerViewHeightAnchor?.isActive = true
        
        // add TextField
        LocationContainerView.addSubview(LocationTextField)
        
        // need location of the box: x, y, width, height
        LocationTextField.leftAnchor.constraint(equalTo: LocationContainerView.leftAnchor, constant: 12).isActive = true
        LocationTextField.topAnchor.constraint(equalTo: LocationContainerView.topAnchor).isActive = true
        LocationTextField.widthAnchor.constraint(equalTo: LocationContainerView.widthAnchor).isActive = true
        LocationContainerViewHeightAnchor = LocationTextField.heightAnchor.constraint(equalTo: LocationContainerView.heightAnchor)
        
        LocationContainerViewHeightAnchor?.isActive = true
    }
         
    let SaveButton: UIButton = {
        let button = UIButton(type: .system)
            button.backgroundColor = .purple
            button.setTitle("Save", for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()
    
    func setupSaveButton() {
        // need location of the box: x, y, width, height
        SaveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SaveButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        SaveButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        SaveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "backgroundMain")
        title = "Account"
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 27)!,
        NSAttributedString.Key.foregroundColor: UIColor.black]
        view.addSubview(UserNameContainerView)
        view.addSubview(UniversityContainerView)
        view.addSubview(MajorContainerView)
        view.addSubview(JobContainerView)
        view.addSubview(LocationContainerView)
        view.addSubview(SaveButton)
        
        setupUserNameView()
        setupUniversityView()
        setupMajorView()
        setupJobView()
        setupLocationView()
        setupSaveButton()
    }
                                                                
    @objc func handleSave() {
        guard let university = UniversityTextField.text, let major = MajorTextField.text, let job = JobTextField.text, let location = LocationTextField.text else {
            print("Form is not valid")
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let ref = Database.database().reference(fromURL: "https://gradcareer-c3376-default-rtdb.firebaseio.com/")
            // create a child reference
            let usersReference = ref.child("users").child(uid)
        let values = ["university": university, "major": major, "job": job, "location": location]
            usersReference.updateChildValues(values, withCompletionBlock: {(err, ref) in
                
                if err != nil {
                    print("err")
                    return
            }
        })
        // add alert
        let refreshAlert = UIAlertController(title: "", message: "Information has been saved.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                    print("Handle Ok logic here")
           }))

            self.present(refreshAlert, animated: true, completion: nil)
    }
}
