//
//  CustomNavigationBar.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Binding var condition: Bool
    var backButtonAction: () -> ()
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
            ZStack {
                if condition {
                    HStack {
                        Button(action: backButtonAction, label: {
                            Image(systemName: "arrow.left")
                                .font(Font.title3.weight(.bold))
                                .foregroundColor(.purple)
                        })
                        Spacer()
                    }
                }
                HStack {
                    Text(condition ? "Pesquise" : "Pesquise por uma empresa")
                        .font(condition ? .title : Font.system(size: 40, weight: .bold))
                        .bold()
                        .foregroundColor(.fadedBlack)
                    if !condition {
                        Spacer()
                    }
                }
            }
            .padding(.top, 35)
        }
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(condition: .constant(false), backButtonAction: {})
    }
}
