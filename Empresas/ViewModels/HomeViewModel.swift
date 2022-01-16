//
//  HomeViewModel.swift
//  Empresas
//
//  Created by Rodrigo Cavalcanti on 15/01/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchString = "" {
        didSet {
            if receivedNoResults {
                receivedNoResults = false
            }
        }
    }
    private var disposeBag = Set<AnyCancellable>()
    @Published var searchResults = Enterprises(enterprises: [])
    @Published var screen: HomeViewScreen = .loading
    @Published var selectedEnterprise = Enterprise(id: 1994, enterpriseName: "McDonalds", photo: "/uploads/enterprise/photo/18/240.jpeg", description: "Restaurante", enterpriseType: EnterpriseType(enterpriseTypeName: "Restaurante"))
    @Published var receivedNoResults = false
    
    func debounceSearchableStringChanges(accessToken: String, client: String, uid: String) {
        $searchString
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink {
                self.searchOnApi(word: $0, accessToken: accessToken, client: client, uid: uid)
            }
            .store(in: &disposeBag)
    }
    
    func searchOnApi(word: String, accessToken: String, client: String, uid: String, testCondition: @escaping () -> () = {}) {
        if word != "" {
            guard let url = URL(string: "https://empresas.ioasys.com.br/api/v1/enterprises?name=\(word.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? word)") else {
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
                            if unwrappedSearchResults.enterprises.isEmpty {
                                receivedNoResults = true
                            } else {
                                searchResults = unwrappedSearchResults
                            }
                            testCondition()
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
    deinit {
        disposeBag.removeAll()
    }
    
}
