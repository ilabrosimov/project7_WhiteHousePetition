//
//  Petition.swift
//  project7_WhiteHousePetition
//
//  Created by Ilia Abrosimov on 07.07.2022.
//

import Foundation

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
