//
//  ViewController.swift
//  AlamofireRouter
//
//  Created by Alex Corlatti on 05/31/2016.
//  Copyright (c) 2016 Alex Corlatti. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var post: [String: Any] {

            return [
                "title": "foo",
                "body": "bar",
                "userId": 1
            ]
        }

        Alamofire.request(MyAPI.createPost(post: post)).response { response in
            
            let error = response.error as? NSError
            let data = response.data
            let string = String(data: data!, encoding: .utf8)
            let httpResponse = response.response

            print((error, data, string, httpResponse))

            Alamofire.request(MyAPI.requestPosts(idPost: "1")).response { response in
                
                let error = response.error as? NSError
                let data = response.data
                let string = String(data: data!, encoding: .utf8)
                let httpResponse = response.response
                
                print((error, data, string, httpResponse))

            }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
