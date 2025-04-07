//
//  User.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import Foundation

//struct User: Codable {
//    
//    let ActName: String?
//    let actid: String?
//}


struct User: Codable {
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





