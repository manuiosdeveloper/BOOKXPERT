//
//  UserViewModel.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import Foundation



class AccountViewModel {
    var accounts: [AccountEntity] = []

    func loadFromJSONAndSaveToCoreData(filename: String, completion: @escaping () -> Void) {
//        guard let url = Bundle.main.url(forResource: filename, withExtension: "Service") else {
//            print("JSON not found")
//            return
//        }
        
        guard let url = Bundle.main.url(forResource: "Service", withExtension: "json") else {
            print("JSON not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Account].self, from: data)
            CoreDataManager.shared.saveAccounts(decoded)
            fetchFromCoreData()
            completion()
        } catch {
            print("❌ JSON decode error: \(error)")
        }
    }

    func fetchFromCoreData() {
        accounts = CoreDataManager.shared.fetchAccounts()
    }

    func updateAccount(id: Int, newName: String) {
        CoreDataManager.shared.updateAccount(id: id, newName: newName)
        fetchFromCoreData()
    }

    func deleteAccount(id: Int) {
        CoreDataManager.shared.deleteAccount(id: id)
        fetchFromCoreData()
    }

    func account(at index: Int) -> AccountEntity {
        return accounts[index]
    }

    var accountCount: Int {
        return accounts.count
    }
}







//class AccountViewModel {
//    private(set) var accounts: [Account] = []
//
//    func loadAccounts(from filename: String, completion: @escaping () -> Void) {
//        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoded = try JSONDecoder().decode([Account].self, from: data)
//            self.accounts = decoded
//            completion()
//        } catch {
//            print("Failed to load or parse JSON: \(error)")
//        }
//    }
//
//    func account(at index: Int) -> Account {
//        return accounts[index]
//    }
//
//    var accountCount: Int {
//        return accounts.count
//    }
//}


//class UserViewModel {
//    private(set) var users: [User] = []
//
//    func loadUsers(from filename: String, completion: @escaping () -> Void) {
//        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
//            self.users = decodedUsers
//            completion()
//        } catch {
//            print("Failed to load or parse JSON: \(error)")
//        }
//    }
//
//    func user(at index: Int) -> User {
//        return users[index]
//    }
//
//    var userCount: Int {
//        return users.count
//    }
//}

