//
//  ViewController.swift
//  GradCareer
//
//  Created by Ziyi Liao on 3/16/22.
//

import UIKit
import Firebase

class HomeViewController: UICollectionViewController, UISearchBarDelegate {
    // create cells
    private let cellId = "searchCellID"
    // create a var for the search controller, go to line 24, bars including position and location
    private let searchController = UISearchController(searchResultsController: nil)
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let logoutError{
            print(logoutError)
        }
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    
    private var jobResults = [Posting]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let ref = Database.database().reference(fromURL: "https://gradcareer-c3376-default-rtdb.firebaseio.com/")
        ref.updateChildValues(["someValue": 123123])
        */
        
        // create a logout button at top-left
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        // user is not logged in
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
        
        title = "Home"
        collectionView.backgroundColor = UIColor(named: "backgroundMain")
        collectionView.register(SearchViewCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        
        Service.shared.getResults() {[weak self] result in
            switch result {
            case .success(let results):
                print(results)
                self?.jobResults = results
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // using UISearchBar need to add UISearchBarDelegate at line 10, which allows us to show search bar cell
    let citySearchBar = UISearchBar()
    
    // begin to create a search bar
    private func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        textFieldInsideSearchBar?.placeholder = "position"
        // add another tab in controller
        searchController.view.addSubview(citySearchBar)
        citySearchBar.frame = CGRect(x: 10, y: searchController.searchBar.frame.height + 50, width: view.frame.size.width - 40, height: 50)
        citySearchBar.placeholder = "location"
        citySearchBar.layer.cornerRadius = 12
        // must set delegate for each of controller, otherwise it will not work
        citySearchBar.delegate = self
        // after finishing searchBar, add the function into viewDidLoad
    }
    
    var timer: Timer?
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let position = searchController.searchBar.text, let city = citySearchBar.text{
            timer?.invalidate()
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {(_) in
                
                Service.shared.getResults() {[weak self] result in
                    switch result {
                    case .success(let results):
                        print(results)
                        self?.jobResults = results
                        
                        DispatchQueue.main.async {
                            self?.collectionView.reloadData()
                        }
                        
                        
                    case .failure(let error):
                        print(error)
                    }
                }
        })
    }
}
    
    // how many cells do I want to display
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobResults.count
    }
    
    // create more space between searchController and cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 10.0, right: 1.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchViewCell
        
        cell.layer.cornerRadius = 12
        let jobResult = jobResults[indexPath.item]
        cell.jobResult = jobResult
        
        return cell
    }
    
    // how to implement clicking the job cell and go into it and see information
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = JobDetailsViewController()
        detailController.jobResult = jobResults[indexPath.item]
        navigationController?.pushViewController(detailController, animated: true)
    }
    
    // specify the job cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 180)
    }
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:)has not been implemented")
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
}
