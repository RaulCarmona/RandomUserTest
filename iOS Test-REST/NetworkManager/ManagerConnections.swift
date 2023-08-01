//
//  ManagerConnections.swift
//  iOS Test-REST
//
//  Created by Luis Carmona on 31/07/23.
//

import Foundation

final class ManagerConnections {
    func fetchUsers(users: String?, gender: Gender?, _ completion: @escaping (_ success: Bool, _ data: [User]?) -> Void) {
        let session = URLSession.shared
        var components = URLComponents(string: Constants.URL.main)!
        components.queryItems = [
            URLQueryItem(name: "results", value: users ?? "20"),
            URLQueryItem(name: "gender", value: gender?.rawValue ?? "")
        ]
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                completion(false, nil)
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode(Users.self, from: data)
                    completion(true, users.listOfUsers)
                } catch {
                    completion(false, nil)
                    print("Ha ocurrido un error: \(error.localizedDescription)")
                }
            } else {
                completion(false, nil)
                print("Network request failed")
            }
        }.resume()
    }
}
