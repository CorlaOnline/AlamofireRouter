//
//  MyAPI.swift
//  CampusParty
//
//  Created by Alex Corlatti on 31/05/16.
//  Copyright © 2016 Mindtek. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireRouter

enum MyAPI: RouterProtocol {

    case requestPosts(idPost: String)
    case createPost(post: [String: Any])
    case fakeRequest(fakeParam: String)

    // MARK: - Base URL
    var router: Router { return Router(baseURL: "http://jsonplaceholder.typicode.com/") }

    // MARK: - Endpoint
    public func asURLRequest() throws -> URLRequest {
    
        switch self {
            
        case .requestPosts(let idPost):
            
            return router.endPoint(path: "posts/\(idPost)")
            
        case .createPost(let post):
            
            return router.endPoint(path: "posts", method: .post, parameters: post, headers: [["prova": "field"]])
            
        case .fakeRequest(let fakeParam):
            
            return router.endPoint(path: "fakePath", method: .patch, parameters: ["par" : fakeParam], encoding: JSONEncoding.prettyPrinted, headers: [["prova": "field"]])
            
        }
    
    }

}
