//
//  ViewController.swift
//  SearchBarwithTableView
//
//  Created by sangheon on 2020/11/19.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate {
    
    @IBOutlet var table:UITableView!
    @IBOutlet var field:UITextField!
    @IBOutlet var searchBar:UISearchBar!
    
    var data = [String]()
    var filterData = [String]()
    var filtered = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    private func setupData() {
        data.append("John")
        data.append("Abe")
        data.append("Dan")
        data.append("zach")
        data.append("Melanie")
        data.append("Sarah")
        data.append("Shawn")
        data.append("Tom")
        data.append("Teri")
        data.append("Kevin")
        data.append("John")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text { //textfiled.text 가 옵셔널이라서
            filterText(text+string)
        }
        return true
    }
    
  
    func filterText(_ query:String) {
        filterData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query) {
                filterData.append(string)
            }
        }
        table.reloadData()
        filtered = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filterData.isEmpty {
            return filterData.count
        }
        return filtered ? 0 : data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        if !filterData.isEmpty {
            cell.textLabel?.text = filterData[indexPath.row]
        }
        else {
            cell.textLabel?.text = data[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: Search Bar config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        <#code#>
    }
}


