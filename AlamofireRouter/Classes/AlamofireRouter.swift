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

    public func endPoint(path path: String, method: Alamofire.Method = .GET, parameters: [String : AnyObject] = [ : ], encoding: ParameterEncoding = .URL, headers: [[String: String]] = [[ : ]]) -> NSMutableURLRequest {

        guard let url = NSURL(string: baseURL.stringByAppendingString(path)) else {

            return ParameterEncoding.URL.encode(NSMutableURLRequest(), parameters: nil).0

        }

        let mutableURLRequest = NSMutableURLRequest(URL: url)

        mutableURLRequest.HTTPMethod = method.rawValue

        for header in headers {

            for (field, value) in header {

                mutableURLRequest.addValue(value, forHTTPHeaderField: field)

            }

        }

        return encoding.encode(mutableURLRequest, parameters: parameters).0

    }

}

// MARK: - RouterProtocol
public protocol RouterProtocol: URLRequestConvertible {

    var router: Router { get }

}
