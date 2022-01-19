//
//  EmpresasUITests.swift
//  EmpresasUITests
//
//  Created by Rodrigo Cavalcanti on 14/01/22.
//

import XCTest

class EmpresasUITests: XCTestCase {
    let app = XCUIApplication()
    
    func login(wrongPassword: Bool = false) {
        app.launch()
        sleep(3)
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("testeapple@ioasys.com.br")

        

        app.secureTextFields["Senha"].tap()
        app.secureTextFields["Senha"].typeText(wrongPassword ? "1234" : "12341234")
        
        app.buttons["ENTRAR"].tap()
    }
    
    func search(word: String) {
        let buscarTextField = app.textFields["Buscar..."]
        buscarTextField.tap()
        buscarTextField.typeText(word)
    }
    
    func searchAndAccessDetail() {
        search(word: "Investment")
        sleep(3)
        app.staticTexts["Investment Searcher"].tap()
    }
    
    func testSearchScreenAccess() throws {
        login()
        XCTAssertEqual(app.staticTexts["Pesquise por uma empresa"].waitForExistence(timeout: 5), true, "Não foi possível acessar a tela de buscas")
        app.terminate()
    }
    
    func testFailedLoginAttempt() throws {
        login(wrongPassword: true)
        XCTAssertEqual(app.staticTexts["Endereço de email ou senha inválida, tente novamente."].waitForExistence(timeout: 5), true, "Não foi possível verificar o texto de acesso negado")
        app.terminate()
    }
    
    func testSearchDetailAccess() throws {
        login()
        sleep(3)
        searchAndAccessDetail()
        XCTAssertEqual(app.staticTexts["Fintech"].waitForExistence(timeout: 5), true, "Não foi possível acessar o detalhe da tela de buscas")
        app.terminate()
    }
    
    func testNoResultSearch() throws {
        login()
        sleep(3)
        search(word: "*")
        XCTAssertEqual(app.staticTexts["Empresa não encontrada"].waitForExistence(timeout: 5), true, "Não foi possível acessar o detalhe da tela de buscas")
        app.terminate()
    }
    
    func testAll() throws {
        login(wrongPassword: true)
        sleep(2)
        app.secureTextFields["Senha"].tap()
        app.secureTextFields["Senha"].typeText("1234")
        app.buttons["ENTRAR"].tap()
        sleep(2)
        search(word: "*")
        sleep(2)
        let buscarTextField = app.textFields["Buscar..."]
        buscarTextField.clear()
        sleep(2)
        searchAndAccessDetail()
        XCTAssertEqual(app.staticTexts["Fintech"].waitForExistence(timeout: 5), true, "Não foi possível acessar o detalhe da tela de buscas")
        app.terminate()
    }
}

extension XCUIElement {
    public func clear() {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
        lowerRightCorner.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
    }
}
