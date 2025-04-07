//
//  ViewController.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 04/04/25.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let viewModel = AccountViewModel()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // fetchAccounts()
        
        loadData()
       
    }
    

    
    private func loadData() {
        
        
        
        // Load from JSON (first-time only)
                viewModel.loadFromJSONAndSaveToCoreData(filename: "accounts") {
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }

        // For future use without loading JSON again:
                // viewModel.fetchFromCoreData()
        
 
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.accountCount

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell
        let account = viewModel.account(at: indexPath.row)
       // cell.textLabel?.text = "\(account.actName ?? "N/A") (\(account.nickname ?? "-")) - ID: \(account.actid)"

        cell.userNmeLabel.text = "\(account.actName ?? "N/A")"
        cell.id_Label.text = "\(account.nickname ?? "-")"
        cell.Nickname.text = "\(account.actid)"
        
        
       // "\(account.actName ?? "N/A") (\(account.nickname ?? "-")) - ID: \(account.actid)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    
    
    // Swipe to delete
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                      forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               let account = viewModel.account(at: indexPath.row)
               viewModel.deleteAccount(id: Int(account.actid))
               tableView.deleteRows(at: [indexPath], with: .automatic)
           }
       }

       // Tap to update
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let account = viewModel.account(at: indexPath.row)
           viewModel.updateAccount(id: Int(account.actid), newName: "Updated - \(account.actName ?? "")")
           tableView.reloadRows(at: [indexPath], with: .automatic)
       }




}

