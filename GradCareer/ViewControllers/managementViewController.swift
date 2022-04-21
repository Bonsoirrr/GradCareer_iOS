//
//  ViewController.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/11/22.
//

import UIKit
import SwiftUI
import FirebaseAuth
import Firebase
// import nanopb

struct Todo {
    var todo: String
    var date: Date
}

class managementViewController: UITableViewController {
    
    fileprivate let cellid = "cellID"
    public var todos:[Todo] = []
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundMain")
        // view.backgroundColor = .white
        title = "Management"
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 27)!,
         NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddTab))
        
        self.save()
        
    }
    
    func save() {
        var todosToBeSaved: [String] = []
        var datesToBeSaved: [Date] = []
        for todo in todos {
            todosToBeSaved.append(todo.todo)
            datesToBeSaved.append(todo.date)
        }
        UserDefaults.standard.set(todosToBeSaved, forKey: "todo")
        UserDefaults.standard.set(datesToBeSaved, forKey: "date")
    }
    /*
     @objc func loadData() {
        ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
         ref.child("users").child(uid).child("email").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            print("value: \(value)")
        })
    }
     */
    
    // automatically add application here when tap "I have applied" in Job detail page
    func autohandleAddTab(text: String) {
        print(self.todos.count)
        guard text != "" else {return}
        print(text)
        let a = Todo(todo: text, date: Date())
        print(a)
        self.tableView.beginUpdates()
        self.todos.append(Todo(todo: text, date: Date()))
        print(self.todos)
        let indexPath = IndexPath(row: self.todos.count - 1, section: 0)
        print(self.todos.count)
        print(indexPath)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
        
        saveData(text: text)
    }
           
    func saveData(text: String) {
       // add to database
           self.ref = Database.database().reference()
       guard let uid = Auth.auth().currentUser?.uid else { return }
           self.ref.child(uid).observeSingleEvent(of: .value, with: { (snapshot) in

           if snapshot.hasChild("applications"){
               
               print("true applications exist")

           }else{

               self.ref.child("users").child(uid).child("applications")
           }
       })
           self.ref.child("users").child(uid).child("applications").child("application_\(Int.random(in: 0..<1000))").setValue(["application": text])
    }
     
    
    @objc func handleAddTab() {
        let alert = UIAlertController(title: "Add application", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter an application"
        }
                           
       alert.addAction(UIAlertAction(title: "Add note", style: .default, handler: {(action) in
           guard let textField = alert.textFields?.first else {return}
           guard let text = textField.text else {return}
           guard text != "" else {return}
           print(text)
           self.todos.append(Todo(todo: text, date: Date()))
           print(self.todos)
           let indexPath = IndexPath(row: self.todos.count - 1, section: 0)
           print(self.todos.count)
           print(indexPath)
           self.tableView.beginUpdates()
           self.tableView.insertRows(at: [indexPath], with: .automatic)
           self.tableView.endUpdates()
           // add data to database
           self.saveData(text: text)
        }))
       present(alert, animated: true)
    }
    
    func formatDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        cell.textLabel?.text = todos[indexPath.row].todo
        cell.detailTextLabel?.text = formatDate(date: Date(), format: "yyyy-MM-dd")
        return cell
    }
}
