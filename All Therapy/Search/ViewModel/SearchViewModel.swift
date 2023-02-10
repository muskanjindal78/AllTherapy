//
//  SearchViewModel.swift
//  All Therapy
//
//  Created by Muskan Jindal on 10/02/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var therapyList: [SearchModel]?
    
    func getTherapyList() {
        guard let url = URL(string: "\(Constants.BaseURL)\(Constants.allTherapyListURL)") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(APIModel<[SearchModel]>.self, from: data)
                        if let data = decodedUsers.data {
                            print(decodedUsers.message ?? "")
                            self.therapyList = data
                        }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
