//
//  HomeView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isTyping = false
    @State private var searchString = ""
    var searchStringCondition: Binding<Bool> {
        Binding<Bool> (
            get: {
                !self.searchString.isEmpty
            },
            set: { _ in
                
            }
        )
    }
    var body: some View {
        VStack(spacing: 35) {
            CustomNavigationBar(condition: searchStringCondition, backButtonAction: {
                UIApplication.shared.dismissKeyboard()
                searchString = ""
            })
                .padding(.horizontal)
            StylizedTextField(title: "Buscar...", text: $searchString, type: .search)
                .padding(.horizontal)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
