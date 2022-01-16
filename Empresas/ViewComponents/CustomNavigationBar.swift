//
//  CustomNavigationBar.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Binding var condition: Bool
    @Binding var isDetail: Bool
    @Binding var detailHeading: String
    @Binding var detailSubheading: String
    var backButtonAction: () -> ()
    private var topSafeArea: CGFloat {
        (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 35
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: topSafeArea)
            VStack {
                ZStack {
                    if condition {
                        HStack {
                            Button(action: backButtonAction, label: {
                                Image(systemName: "arrow.left")
                                    .font(Font.title3.weight(.bold))
                                    .foregroundColor(isDetail ? .white : .purple)
                            })
                            Spacer()
                        }
                    }
                    Text(isDetail ? detailHeading : (condition ? "Pesquise" : "Pesquise por uma empresa"))
                        .font(condition ? .title : Font.system(size: 40, weight: .bold))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: !condition ? .leading : .center)
                }
                if isDetail {
                    Text(detailSubheading)
                        .font(.title2)
                }
            }
            .foregroundColor(isDetail ? .white : .fadedBlack)
            .padding(.horizontal)
            .padding(.bottom, isDetail ? 24 : 35)
        }
        .background(getBackground(isDetail))
    }
    
    @ViewBuilder func getBackground(_ condition: Bool) -> some View {
        if condition {
            Image("navigationBarBackground").resizable()
        } else {
            EmptyView()
        }
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(condition: .constant(false), isDetail: .constant(false), detailHeading: .constant("McDonalds"), detailSubheading: .constant("Restaurante"), backButtonAction: {})
    }
}
