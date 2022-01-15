//
//  EmailAndPasswordViewModel.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import Foundation
import SwiftUI

class EmailAndPassworViewwModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    var loginButtonDisableCondition: Binding<Bool> {
        Binding<Bool> (
            get: {
                self.email.isEmpty || self.password.isEmpty
            },
            set: { _ in
                
            }
        )
    }
    func loginButtonAction() {
        let loginInfo = LoginInfo(email: email, password: password)
        
        guard let encoded = try? JSONEncoder().encode(loginInfo) else {
            print("Failed to encode order")
            return
        }
        guard let url = URL(string: "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let unwrappedURL = response as? HTTPURLResponse {
                if let statusCode = unwrappedURL.allHeaderFields.first(where: {$0.key as! String == "Status"})?.value as? String {
                    print(statusCode)
                }
//                for i in ["access-token", "client", "uid"] {
//                    print(unwrappedURL.allHeaderFields.first(where: {$0.key == AnyHashable(i)})?.value as! String)
//                }
                print(response)
            }
        }.resume()
    }
}
