//
//  ServiceRequest.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 04/04/25.
//

import Foundation


//struct Account: Codable {
//    let ActName: String
//    let actid: Int
//}


struct Account: Codable {
    let ActName: String
    let actid: String

    enum CodingKeys: String, CodingKey {
        case ActName
        case actid
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ActName = try container.decode(String.self, forKey: .ActName)

        // Try decoding actid as Int first, then String
        if let actidInt = try? container.decode(Int.self, forKey: .actid) {
            actid = String(actidInt)
        } else {
            actid = try container.decode(String.self, forKey: .actid)
        }
    }
}

func fetchAccounts() {
    guard let url = URL(string: "https://fssservices.bookxpert.co/api/Fillaccounts/nadc/2025") else {
        print("❌ Invalid URL")
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                // Step 1: Convert response to string and clean it
                var rawString = String(data: data, encoding: .utf8) ?? ""
                rawString = rawString
                    .replacingOccurrences(of: "📦 Raw JSON:", with: "")
                    .replacingOccurrences(of: "\\", with: "")

                // Step 2: Convert cleaned string back to Data
                guard let cleanedData = rawString.data(using: .utf8) else {
                    print("❌ Failed to convert cleaned string to Data")
                    return
                }

                // Step 3: Decode the JSON
                let decoder = JSONDecoder()
                let accounts = try decoder.decode([Account].self, from: cleanedData)

                // Step 4: Print the result
                print("✅ Decoded Accounts:")
                for account in accounts {
                    print("• \(account.ActName) (ID: \(account.actid))")
                }

            } catch {
                print("❌ JSON decoding error:", error)
            }
        } else if let error = error {
            print("❌ API Error:", error)
        }
    }.resume()
}


