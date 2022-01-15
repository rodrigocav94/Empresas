//
//  LoginScreenView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var loginScreenViewModel = LoginScreenViewModel()
    
    var body: some View {
        ZStack {
            SplashScreenBackground(showingInitialLogo: $loginScreenViewModel.showingInitialLogo, darkeningScreen: $loginScreenViewModel.darkeningScreen)
            
            if loginScreenViewModel.darkeningScreen {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    LoginTitleAndLogo()
                    
                    EmailAndPasswordCard()

                }
                .animation(.spring())
                .transition(.move(edge: .bottom))
            }
        }
        .animation(.default)
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
