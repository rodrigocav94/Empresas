//
//  HomeView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isTyping = false
    var body: some View {
        Text("OI")
//        VStack {
//            VStack {
//                Spacer()
//                    .frame(height: 68)
//                ZStack {
//                    if isTyping {
//                        HStack {
//                            Image(systemName: "arrow.left")
//                                .font(Font.title3.weight(.bold))
//                                .foregroundColor(.purple)
//                            Spacer()
//                        }
//                    }
//                    HStack {
//                        Text(isTyping ? "Pesquise" : "Pesquise por uma empresa")
//                            .font(isTyping ? .title : Font.system(size: 40, weight: .bold))
//                            .bold()
//                            .foregroundColor(Color("FadedBlack"))
//                        if !isTyping {
//                            Spacer()
//                        }
//                    }
//                }
//            }
//            .padding(.horizontal, 24)
//            .onTapGesture {
//                withAnimation {
//                    isTyping.toggle()
//                }
//            }
//            Spacer()
//        }.edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
