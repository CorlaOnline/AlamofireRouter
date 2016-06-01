//
//  MyAPI.swift
//  CampusParty
//
//  Created by Alex Corlatti on 31/05/16.
//  Copyright © 2016 Mindtek. All rights reserved.
//

import UIKit
import AlamofireRouter

enum MyAPI: RouterProtocol {

    case requestPosts(idPost: String)
    case createPost(post: [String: AnyObject])
    case fakeRequest(fakeParam: String)

    // MARK: - Base URL
    var router: Router { return Router(baseURL: "http://jsonplaceholder.typicode.com/") }

    // MARK: - Endpoint
    var URLRequest: NSMutableURLRequest {

        switch self {

        case .requestPosts(let idPost):

            return router.endPoint(path: "posts/\(idPost)")

        case .createPost(let post):

            return router.endPoint(path: "posts", method: .POST, parameters: post)

        case .fakeRequest(let fakeParam):

            return router.endPoint(path: "fakePath", method: .PATCH, parameters: ["par" : fakeParam], encoding: .JSON)

        }

    }

}
