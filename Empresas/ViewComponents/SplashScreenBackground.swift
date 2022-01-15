//
//  SplashScreenBackground.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI

struct SplashScreenBackground: View {
    @Binding var showingInitialLogo: Bool
    @Binding var darkeningScreen: Bool
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFit()
            if showingInitialLogo {
                Image("initialLogo")
            }
            Color.black.opacity(darkeningScreen ? 0.8 : 0).blendMode(.softLight)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginSplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenBackground(showingInitialLogo: .constant(false), darkeningScreen: .constant(false))
    }
}
