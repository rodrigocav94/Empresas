//
//  LoginScreenViewModel.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import Foundation

class LoginScreenViewModel: ObservableObject {
    @Published var showingInitialLogo = false
    @Published var darkeningScreen = false
    
    private func delayLogo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showingInitialLogo.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showingInitialLogo.toggle()
            self.darkeningScreen = true
        }
    }
    init() {
        delayLogo()
    }
}
