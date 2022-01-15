//
//  HTTPURLResponseExtensions.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation

extension HTTPURLResponse {
    func getKeyValue(for header: String) -> String {
        (self.allHeaderFields.first(where: {$0.key == AnyHashable(header)})?.value as? String) ?? ""
    }
}
