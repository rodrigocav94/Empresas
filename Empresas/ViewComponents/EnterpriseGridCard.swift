//
//  EnterpriseGridCard.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct EnterpriseGridCard: View {
    var photoUrl: URL
    var name: String
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("gridItemBackground")
                    .resizable()
                    .frame(height: 107)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            AsyncImage(url: photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 160)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    Text(name)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .frame(height: 33)
                        .background(Color.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 4)
        .frame(maxWidth: 152)
    }
}

struct EnterpriseGridCard_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseGridCard(photoUrl: URL(string: "https://empresas.ioasys.com.br/uploads/enterprise/photo/18/240.jpeg")!, name: "Name")
    }
}
