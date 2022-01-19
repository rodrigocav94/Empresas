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
            VStack(alignment: .leading) {
                Text("Digite seus dados para continuar.")
                    .bold()
                    .foregroundColor(.fadedBlack)
                if emailAndPassworViewwModel.failedAttempt {
                    Text("Endereço de email ou senha inválida, tente novamente.")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            Group {
                StylizedTextField(title: "Email", text: $emailAndPassworViewwModel.email, didFail: $emailAndPassworViewwModel.failedAttempt)
                StylizedTextField(title: "Senha", text: $emailAndPassworViewwModel.password, type: .password, didFail: $emailAndPassworViewwModel.failedAttempt)
            }
            .foregroundColor(emailAndPassworViewwModel.failedAttempt ? .red : .fadedBlack)
            
            LoginButton(disableCondition: .constant(emailAndPassworViewwModel.email.isEmpty || emailAndPassworViewwModel.password.isEmpty), action: {
                emailAndPassworViewwModel.loginButtonAction(sessionDetails: sessionDetails, failAttemptTracker: $emailAndPassworViewwModel.failedAttempt)})
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
