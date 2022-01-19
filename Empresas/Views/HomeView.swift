//
//  HomeView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        if homeViewModel.screen == .loading {
            LoadingScreenView(homeViewModel: homeViewModel)
        } else {
            VStack(spacing: 0) {
                CustomNavigationBar(condition: .constant(!self.homeViewModel.searchString.isEmpty), isDetail: .constant(homeViewModel.screen == .detail), detailHeading: .constant(homeViewModel.selectedEnterprise.enterpriseName), detailSubheading: .constant(homeViewModel.selectedEnterprise.enterpriseType.enterpriseTypeName), backButtonAction: {
                    UIApplication.shared.dismissKeyboard()
                    if homeViewModel.screen == .search {
                        homeViewModel.searchString = ""
                    } else {
                        homeViewModel.screen = .search
                    }
                })
                if homeViewModel.screen == .search {
                    SearchScreenView(homeViewModel: homeViewModel)
                        .overlay(VStack {
                            LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
                                .frame(height: 10)
                            Spacer()
                        })
                } else {
                    ResultDetailView(homeViewModel: homeViewModel)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
