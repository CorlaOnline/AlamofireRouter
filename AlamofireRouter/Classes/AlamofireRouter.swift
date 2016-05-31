//
//  Router.swift
//
//  Created by Alex Corlatti on 31/05/16.
//  Copyright © 2016 CorlaOnline. All rights reserved.
//

import UIKit
import Alamofire

// MARK: - Router struct
public struct Router {

    var baseURL = ""

    public init(baseURL: String) {

        self.baseURL = baseURL

    }

    public func endPoint(path path: String, method: Alamofire.Method = .GET, parameters: [String : AnyObject] = [ : ], encoding: ParameterEncoding = .URL) -> NSMutableURLRequest {

        let mutableURLRequest = NSMutableURLRequest(URL: NSURL(string: baseURL.stringByAppendingString(path))!)
        mutableURLRequest.HTTPMethod = method.rawValue

        return encoding.encode(mutableURLRequest, parameters: parameters).0

    }

}

// MARK: - RouterProtocol
public protocol RouterProtocol: URLRequestConvertible {

    var router: Router { get }

}
