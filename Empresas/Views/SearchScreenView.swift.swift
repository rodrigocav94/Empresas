//
//  SearchScreenView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 16/01/22.
//

import SwiftUI

struct SearchScreenView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    let columns = [
        GridItem(.adaptive(minimum: 152))
    ]
    
    var body: some View {
        StylizedTextField(title: "Buscar...", text: $homeViewModel.searchString, type: .search)
        .padding(.horizontal)
        
        if homeViewModel.receivedNoResults {
            VStack {
                Image("noResults")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text("Empresa não encontrada")
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding(.top, 80)
        } else {
            List {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(homeViewModel.searchResults.enterprises) { enterprise in
                        EnterpriseGridCard(photoUrl: enterprise.photoURL, name: enterprise.enterpriseName)
                            .onTapGesture {
                                homeViewModel.selectedEnterprise = enterprise
                                homeViewModel.screen = .detail
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView(homeViewModel: HomeViewModel())
    }
}
