//
//  CoreDataManager.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import Foundation


import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveAccount(account: Account) {
        let entity = AccountEntity(context: context)
        entity.actName = account.ActName
        entity.actid = Int32(account.actid) ?? 0
        
        // 🆕 Nickname from first 5 letters
        let cleanName = account.ActName.trimmingCharacters(in: .whitespacesAndNewlines)
        let nickname = cleanName.count >= 5 ? String(cleanName.prefix(6)) : cleanName
        entity.nickname = nickname

        saveContext()
    }

    func saveAccounts(_ accounts: [Account]) {
        for acc in accounts {
            saveAccount(account: acc)
        }
    }

    func fetchAccounts() -> [AccountEntity] {
        let request: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("❌ Fetch error: \(error)")
            return []
        }
    }

    func updateAccount(id: Int, newName: String) {
        let request: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        request.predicate = NSPredicate(format: "actid == %d", id)

        do {
            if let entity = try context.fetch(request).first {
                entity.actName = newName
                let nickname = newName.count >= 5 ? String(newName.prefix(6)) : newName
                entity.nickname = nickname
                saveContext()
            }
        } catch {
            print("❌ Update error: \(error)")
        }
    }

    func deleteAccount(id: Int) {
        let request: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        request.predicate = NSPredicate(format: "actid == %d", id)

        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                saveContext()
            }
        } catch {
            print("❌ Delete error: \(error)")
        }
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("❌ Save context error: \(error)")
        }
    }
}

