//
//  SessionDetails.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation

class SessionDetails: ObservableObject {
    @Published var currentScreen: Screen = .login
    @Published var loginDetails = LoginDetails()
    var loginIsPopulated: Bool {
        self.loginDetails.accessToken != "" || self.loginDetails.client != "" || self.loginDetails.uid != ""
    }
}
