//
//  UIApplicationExtensions.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
