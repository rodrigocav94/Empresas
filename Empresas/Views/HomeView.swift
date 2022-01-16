//
//  HomeView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var searchStringCondition: Binding<Bool> {
        Binding<Bool> (
            get: {
                !self.homeViewModel.searchString.isEmpty
            },
            set: { _ in
                
            }
        )
    }
    
    var isDetailScreen: Binding<Bool> {
        Binding<Bool> (
            get: {
                homeViewModel.screen == .detail
            },
            set: { _ in
                
            }
        )
    }
    
    var detailHeadingBinding: Binding<String> {
        Binding<String> (
            get: {
                homeViewModel.selectedEnterprise.enterpriseName
            },
            set: { _ in
                
            }
        )
    }
    
    var detailSubheadingBinding: Binding<String> {
        Binding<String> (
            get: {
                homeViewModel.selectedEnterprise.enterpriseType.enterpriseTypeName
            },
            set: { _ in
                
            }
        )
    }
    
    var body: some View {
        if homeViewModel.screen == .loading {
            LoadingScreenView(homeViewModel: homeViewModel)
        } else {
            VStack(spacing: 0) {
                CustomNavigationBar(condition: searchStringCondition, isDetail: isDetailScreen, detailHeading: detailHeadingBinding, detailSubheading: detailSubheadingBinding, backButtonAction: {
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
