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

        var post: [String: AnyObject] {

            return [
                "title": "foo",
                "body": "bar",
                "userId": 1
            ]
        }

        Alamofire.request(MyAPI.createPost(post: post)).response { resp in

            print((resp.0, resp.1, resp.2, resp.3))

            Alamofire.request(MyAPI.requestPosts(idPost: "1")).response { resp in

                print((resp.0, resp.1, resp.2, resp.3))

            }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
