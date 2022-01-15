//
//  HomeView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var sessionDetails: SessionDetails
    
    var searchStringCondition: Binding<Bool> {
        Binding<Bool> (
            get: {
                !self.homeViewModel.searchString.isEmpty
            },
            set: { _ in
                
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 35) {
            CustomNavigationBar(condition: searchStringCondition, backButtonAction: {
                UIApplication.shared.dismissKeyboard()
                homeViewModel.searchString = ""
            })
                .padding(.horizontal)
            StylizedTextField(title: "Buscar...", text: $homeViewModel.searchString, type: .search)
                .padding(.horizontal)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear(perform: {
            homeViewModel.debounceSearchableStringChanges(accessToken: sessionDetails.loginDetails.accessToken, client: sessionDetails.loginDetails.client, uid: sessionDetails.loginDetails.uid)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
