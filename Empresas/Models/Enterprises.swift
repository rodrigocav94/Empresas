//
//  Enterprises.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation

struct Enterprises: Codable {
    let enterprises: [Enterprise]
}

// MARK: - Enterprise
struct Enterprise: Codable {
    let id: Int
    let enterpriseName, photo, description: String
    let enterpriseType: EnterpriseType
}

// MARK: - EnterpriseType
struct EnterpriseType: Codable {
    let enterpriseTypeName: String
}
