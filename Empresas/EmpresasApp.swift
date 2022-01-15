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
                    .environment(\.colorScheme, .light)
                    .environmentObject(sessionDetails)
            case .home:
                HomeView()
                    .environment(\.colorScheme, .light)
                    .transition(.slide)
                    .animation(.default)
            }
        }
    }
}
