//
//  LoginTextField.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import SwiftUI
import Combine

struct LoginTextField: View {
    var title: String
    @Binding var text: String
    var canBeHidden = false
    @State private var isHiding = true
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if !self.text.isEmpty {
                Text(title)
                    .font(.footnote)
            }
            HStack {
                getTextField()
                if canBeHidden {
                    Button(action: {
                        isHiding.toggle()
                    }, label: {
                        Image(systemName: isHiding ? "eye" : "eye.slash")
                            .foregroundColor(.secondary)
                    })
                }
            }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(isEditing ? Color.purple : Color.secondary, lineWidth: 1))
        }
        .onTapGesture {
            userInteracted()
        }
        .onChange(of: text, perform: {_ in
            userInteracted()
        })
    }
    
    @ViewBuilder func getTextField() -> some View {
        if isHiding && canBeHidden {
            SecureField(title, text: $text, onCommit: {isEditing = false})
        } else {
            TextField(title, text: $text, onCommit: {isEditing = false})
        }
    }
    func userInteracted() {
        isEditing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isEditing = false
        }
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(title: "Email", text: .constant("Email"))
    }
}
