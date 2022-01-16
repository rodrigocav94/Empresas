//
//  ResultDetailView.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 16/01/22.
//

import SwiftUI

struct ResultDetailView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            AsyncImage(url: homeViewModel.selectedEnterprise.photoURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 244)
            } placeholder: {
                ProgressView()
            }
            
            Text(homeViewModel.selectedEnterprise.description)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct ResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ResultDetailView(homeViewModel: HomeViewModel())
    }
}
