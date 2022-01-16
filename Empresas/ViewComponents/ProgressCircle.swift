//
//  ProgressCircle.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import SwiftUI

struct ProgressCircle: View {
    let timer = Timer.publish(every: 0.075, on: .main, in: .common).autoconnect()
    @State private var rotationAmount: Double = 0
    
    var body: some View {
        Image("progressCircle")
            .resizable()
            .scaledToFill()
            .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 0, z: 1))
            .onReceive(timer, perform: { _ in
                self.rotationAmount += 45
            })
            .frame(width: 44, height: 44)
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircle()
    }
}
