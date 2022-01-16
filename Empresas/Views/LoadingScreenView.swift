//
//  LoadingScreenView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 16/01/22.
//

import SwiftUI

struct LoadingScreenView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @EnvironmentObject var sessionDetails: SessionDetails
    
    var body: some View {
        ProgressCircle()
            .onAppear(perform: {
                homeViewModel.debounceSearchableStringChanges(accessToken: sessionDetails.loginDetails.accessToken, client: sessionDetails.loginDetails.client, uid: sessionDetails.loginDetails.uid)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.homeViewModel.screen = .search
                }
            })
            .animation(.none)
    }
}
