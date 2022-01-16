//
//  EmpresasTests.swift
//  EmpresasTests
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import XCTest
import SwiftUI
@testable import Empresas

class EmpresasTests: XCTestCase {
    func testLoginAPIResponse() throws {
        let expectation = self.expectation(description: "Verificar se os parâmetros UID, Access-Token e Client foram recebidos")
        let emailAndPassworViewwModel = EmailAndPassworViewwModel()
        let sessionDetails = SessionDetails()
        
        emailAndPassworViewwModel.email = "testeapple@ioasys.com.br"
        emailAndPassworViewwModel.password = "12341234"
        emailAndPassworViewwModel.loginButtonAction(sessionDetails: sessionDetails, failAttemptTracker: .constant(false), testCondition: {
            if sessionDetails.loginIsPopulated {
                expectation.fulfill()
            } else {
                XCTFail("Um parâmetro ou mais está vazio")
            }
        })
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testSearchAPIResponse() throws {
        let expectation = self.expectation(description: "Verificar se os parâmetros UID, Access-Token e Client foram recebidos")
        let emailAndPassworViewwModel = EmailAndPassworViewwModel()
        let sessionDetails = SessionDetails()
        let homeViewModel = HomeViewModel()
        
        // Login
        emailAndPassworViewwModel.email = "testeapple@ioasys.com.br"
        emailAndPassworViewwModel.password = "12341234"
        emailAndPassworViewwModel.loginButtonAction(sessionDetails: sessionDetails, failAttemptTracker: .constant(false), testCondition: {
            
            homeViewModel.searchOnApi(word: "Investment", accessToken: sessionDetails.loginDetails.accessToken, client: sessionDetails.loginDetails.client, uid: sessionDetails.loginDetails.uid, testCondition: {
                if homeViewModel.searchResults.enterprises.count == 1 {
                    expectation.fulfill()
                } else {
                    XCTFail("Deveria haver apenas um resultado")
                }
            })
            
        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
