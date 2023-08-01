//
//  HomeView.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activity: UIActivityIndicatorView!
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var users = [User]()
    private var filteredUsers = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "iOS Test REST app"
        activity.startAnimating()
        activity.isHidden = false
        viewModel.delegate = self
        numberTextField.delegate = self
        viewModel.bind(view: self, router: router)
        viewModel.getListUsersData(users: nil, gender: nil)
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomUserCell", bundle: nil), forCellReuseIdentifier: "CustomUserCell")
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        if genderSwitch.isOn {
            viewModel.getListUsersData(users: numberTextField.text, gender: .female)
        } else {
            viewModel.getListUsersData(users: numberTextField.text, gender: .male)
        }
        numberTextField.text = ""
        activity.startAnimating()
        activity.isHidden = false
    }
    
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUserCell") as! CustomUserCell
        cell.setupCell(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetailView(user: users[indexPath.row])
    }
}

extension HomeView: HomeViewModelDelegate {
    func didReceiveData(users: [User]) {
        self.users = users
        reloadTableView()
    }
    
    func didFailure() {
        let dialogMessage = UIAlertController(title: "Attention", message: "Something went wrong", preferredStyle: .alert)
        DispatchQueue.main.async {
            let ok = UIAlertAction(title: "OK", style: .default, handler: { [weak self] (action) -> Void in
                self?.reloadTableView()
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}

extension HomeView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            return true
        }
        return false
    }
}
