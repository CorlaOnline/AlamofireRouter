//
//  Router.swift
//
//  Created by Alex Corlatti on 31/05/16.
//  Copyright © 2016 CorlaOnline. All rights reserved.
//

import Alamofire

// MARK: - Router struct
public struct Router {

    var baseURL = ""

    public init(baseURL: String) {

        self.baseURL = baseURL

    }

    public func endPoint(path: String, method: Alamofire.HTTPMethod = .get, parameters: [String : Any] = [ : ], encoding: ParameterEncoding = URLEncoding.default, headers: [[String: String]] = [[ : ]]) -> URLRequest {

        guard let url = URL(string: baseURL + path) else {

            return try! URLEncoding.default.encode(URLRequest(url: URL(string: "")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30), with: nil)
        }

        var request = try! encoding.encode(URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30), with: parameters)

        request.httpMethod = method.rawValue

        for header in headers {

            for (field, value) in header {

                request.addValue(value, forHTTPHeaderField: field)

            }

        }

        return request

    }

}

// MARK: - RouterProtocol
public protocol RouterProtocol: URLRequestConvertible {

    var router: Router { get }

}
