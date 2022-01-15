//
//  LoginTitleAndLogo.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI

struct LoginTitleAndLogo: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [Color("Coral"), .clear]), startPoint: .top, endPoint: .bottom)
                    .mask(
                        Image("backgroundLogo")
                            .resizable()
                            .scaledToFit()
                        )
                    .frame(width: 353, height: 279)
                    .opacity(0.4)
                    .offset(x: 135, y: 92)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Boas vindas,")
                        .font(.largeTitle)
                        .bold()
                    Text("Você está no Empresas.")
                        .font(.title)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.bottom)
            
        }
    }
}

struct LoginTitleAndLogo_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitleAndLogo()
    }
}
