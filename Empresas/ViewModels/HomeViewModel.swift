//
//  HomeViewModel.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchString = ""
    private var disposeBag = Set<AnyCancellable>()
    
    func debounceSearchableStringChanges(accessToken: String, client: String, uid: String) {
        $searchString
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink { newSearchValue in
                print("New Search Value")
                print(newSearchValue)
                print("AccessToken:")
                print(accessToken)
                print("Client:")
                print(client)
                print("UID:")
                print(uid)
                guard let url = URL(string: "https://empresas.ioasys.com.br/api/v1/enterprises?name=\(newSearchValue)") else {
                    print("Invalid URL")
                    return
                }
                var request = URLRequest(url: url)
                request.setValue(accessToken, forHTTPHeaderField: "access-token")
                request.setValue(client, forHTTPHeaderField: "client")
                request.setValue(uid, forHTTPHeaderField: "uid")
                
                URLSession.shared.dataTask(with: request) {data, response, error in
                    if let data = data,
                        let urlContent = NSString(data: data, encoding: String.Encoding.ascii.rawValue) {
                        print(urlContent)
                    } else {
                        print("Error: \(error!)")
                    }
                }.resume()
            }
            .store(in: &disposeBag)
        
    }
    deinit {
        disposeBag.removeAll()
    }
    
}
