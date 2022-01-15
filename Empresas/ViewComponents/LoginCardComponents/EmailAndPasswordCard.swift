//
//  EmailAndPasswordCard.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI

struct EmailAndPasswordCard: View {
    @ObservedObject var emailAndPassworViewwModel = EmailAndPassworViewwModel()
    @EnvironmentObject var sessionDetails: SessionDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Group {
                Text("Digite seus dados para continuar.")
                    .bold()
                StylizedTextField(title: "Email", text: $emailAndPassworViewwModel.email)
                StylizedTextField(title: "Senha", text: $emailAndPassworViewwModel.password, type: .password)
            }
            .foregroundColor(.black)
            LoginButton(disableCondition: emailAndPassworViewwModel.loginButtonDisableCondition, action: { sessionDetails.currentScreen = .home})
                .padding(.bottom, 40)
        }
        .padding()
        .background(Color.white)
        .background(Color.white.offset(y: 50))
    }
}

struct EmailAndPasswordCard_Previews: PreviewProvider {
    static var previews: some View {
        EmailAndPasswordCard()
    }
}
