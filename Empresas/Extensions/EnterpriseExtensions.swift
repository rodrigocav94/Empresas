//
//  EnterpriseExtensions.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation

extension Enterprise {
    var photoURL: URL {
        URL(string: "https://empresas.ioasys.com.br/\(photo)")!
    }
}
