//
//  EmpresasUITests.swift
//  EmpresasUITests
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import XCTest

class EmpresasUITests: XCTestCase {
    let app = XCUIApplication()
    
    func testSearchScreenAccess() throws {
        app.launch()
        sleep(3)
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("testeapple@ioasys.com.br")

        

        app.secureTextFields["Senha"].tap()
        app.secureTextFields["Senha"].typeText("12341234")
        
        app.buttons["ENTRAR"].tap()
        XCTAssertEqual(app.staticTexts["Pesquise por uma empresa"].waitForExistence(timeout: 5), true, "Não foi possível acessar a tela de buscas")
        app.terminate()
    }
    
    func testSearchDetailAccess() throws {
        app.launch()
        sleep(3)
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("testeapple@ioasys.com.br")

        

        app.secureTextFields["Senha"].tap()
        app.secureTextFields["Senha"].typeText("12341234")
        
        app.buttons["ENTRAR"].tap()
        
        sleep(3)
        let buscarTextField = app.textFields["Buscar..."]
        buscarTextField.tap()
        buscarTextField.typeText("Investment")
        sleep(3)
        app.staticTexts["Investment Searcher"].tap()
        XCTAssertEqual(app.staticTexts["Fintech"].waitForExistence(timeout: 5), true, "Não foi possível acessar o detalhe da tela de buscas")
        app.terminate()
    }
}
