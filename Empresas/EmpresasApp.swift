//
//  EmpresasApp.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI

@main
struct EmpresasApp: App {
    @StateObject var sessionDetails = SessionDetails()
    var body: some Scene {
        WindowGroup {
            switch sessionDetails.currentScreen {
            case .login:
                LoginScreenView()
                    .environmentObject(sessionDetails)
            case .home:
                HomeView()
                    .environmentObject(sessionDetails)
                    .transition(.slide)
                    .animation(.default)
            }
        }
    }
}
