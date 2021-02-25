//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Sergei Isaikin on 25.02.2021.
//

import Foundation

class CommentNetworkService {
    private init() {}
    
    static func getComments(comletion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                comletion(response)
            } catch {
                print(error)
            }
        }
    }
}
