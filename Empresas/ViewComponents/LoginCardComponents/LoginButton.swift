//
//  LoginButton.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI

struct LoginButton: View {
    @Binding var disableCondition: Bool
    let action: () -> ()
    
    var body: some View {
        Button(action: action, label: {
            Text("ENTRAR")
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(disableCondition ? Color.secondary : Color.fadedBlack)
                .clipShape(Capsule())
        })
            .disabled(disableCondition)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(disableCondition: .constant(true), action: {})
    }
}
