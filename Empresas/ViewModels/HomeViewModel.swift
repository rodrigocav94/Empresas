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
    @Published var searchResults = Enterprises(enterprises: [])
    
    func debounceSearchableStringChanges(accessToken: String, client: String, uid: String) {
        $searchString
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink { newSearchValue in
                if newSearchValue != "" {
                    guard let url = URL(string: "https://empresas.ioasys.com.br/api/v1/enterprises?name=\(newSearchValue)") else {
                        print("Invalid URL")
                        return
                    }
                    var request = URLRequest(url: url)
                    request.setValue(accessToken, forHTTPHeaderField: "access-token")
                    request.setValue(client, forHTTPHeaderField: "client")
                    request.setValue(uid, forHTTPHeaderField: "uid")
                    
                    URLSession.shared.dataTask(with: request) {data, response, error in
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            decoder.keyDecodingStrategy = .convertFromSnakeCase

                            do {
                                let unwrappedSearchResults = try decoder.decode(Enterprises.self, from: data)
                                DispatchQueue.main.async { [unowned self] in
                                    searchResults = unwrappedSearchResults
                                }
                                return
                            } catch {
                                print("Decoding Failed: \(error)")
                            }
                        } else {
                            print("Error: \(error!)")
                        }
                    }.resume()
                } else {
                    DispatchQueue.main.async { [unowned self] in
                        searchResults = Enterprises(enterprises: [])
                    }
                }
            }
            .store(in: &disposeBag)
        
    }
    deinit {
        disposeBag.removeAll()
    }
    
}
