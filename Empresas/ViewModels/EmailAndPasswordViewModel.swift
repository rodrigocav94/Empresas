//
//  EmailAndPasswordViewModel.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import Foundation
import SwiftUI

class EmailAndPassworViewwModel: ObservableObject {
    @Published var email = "testeapple@ioasys.com.br"
    @Published var password = "12341234"
    @Published var failedAttempt = false
    
    func loginButtonAction(sessionDetails: SessionDetails, failAttemptTracker: Binding<Bool>, testCondition: @escaping () -> () = {}) {
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
            
            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        sessionDetails.loginDetails.client = httpResponse.getKeyValue(for: "client")
                        sessionDetails.loginDetails.accessToken = httpResponse.getKeyValue(for: "access-token")
                        sessionDetails.loginDetails.uid = httpResponse.getKeyValue(for: "uid")
                        if sessionDetails.loginIsPopulated {
                            sessionDetails.currentScreen = .home
                        }
                    } else {
                        failAttemptTracker.wrappedValue = true
                    }
                    testCondition()
                }
            }
        }.resume()
    }
}
