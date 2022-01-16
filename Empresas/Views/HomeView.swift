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
    let columns = [
        GridItem(.adaptive(minimum: 152))
    ]
    
    var body: some View {
        VStack(spacing: 35) {
            Group {
                CustomNavigationBar(condition: searchStringCondition, backButtonAction: {
                    UIApplication.shared.dismissKeyboard()
                    homeViewModel.searchString = ""
                })
                StylizedTextField(title: "Buscar...", text: $homeViewModel.searchString, type: .search)
            }
            .padding(.horizontal)
            
            List {
                if !homeViewModel.searchString.isEmpty {
                    if !homeViewModel.searchResults.enterprises.isEmpty {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(homeViewModel.searchResults.enterprises) { enterprise in
                                EnterpriseGridCard(photoUrl: enterprise.photoURL, name: enterprise.enterpriseName)
                                    .onTapGesture {
                                        
                                    }
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity)
            .overlay(VStack {
                LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
                    .frame(height: 10)
                Spacer()
            })
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
