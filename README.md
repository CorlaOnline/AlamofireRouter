# AlamofireRouter

[![CI Status](http://img.shields.io/travis/Alex Corlatti/AlamofireRouter.svg?style=flat)](https://travis-ci.org/Alex Corlatti/AlamofireRouter)
[![Version](https://img.shields.io/cocoapods/v/AlamofireRouter.svg?style=flat)](http://cocoapods.org/pods/AlamofireRouter)
[![License](https://img.shields.io/cocoapods/l/AlamofireRouter.svg?style=flat)](http://cocoapods.org/pods/AlamofireRouter)
[![Platform](https://img.shields.io/cocoapods/p/AlamofireRouter.svg?style=flat)](http://cocoapods.org/pods/AlamofireRouter)

AlamofireRouter is a simple Alamofire router

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build AlamofireRouter

To integrate AlamofireRouter into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'AlamofireRouter'
```

Then, run the following command:

```bash
$ pod install
```
## Usage

You have to create an ```enum``` that conform ```RouterProtocol```, variables ```router``` and ```URLRequest``` are mandatories.

In ```router``` you have to set your API base URL.

In ```URLRequest``` you can create your endpoints by function ```router.endPoint```.

The function ```router.endPoint``` has four parameters:

* ```path: String``` the path for the endpoint
* ```method: Alamofire.Method``` the method of the request, by default is ```.GET```
* ```parameters: [String : AnyObject]``` the parameters if necessary, by default is ```[ : ]```
* ```encoding: ParameterEncoding``` the encoding type, by default is ```.URL```
* ```headers: [[String: String]]``` the header parameters if necessary, by default is ```[[:]]```

### Create your router API

```swift
import AlamofireRouter

enum MyAPI: RouterProtocol { 

    case myRequest(myParameter: String)
    case otherRequest(otherParameter: [String: AnyObject])
    case allPersonalizedRequest(param: String)

    var router: Router { return Router(baseURL: "http://YOUR_API_BASE_URL.com/") }

    var URLRequest: NSMutableURLRequest {

        switch self {

            case .myRequest(let myParameter):

                return router.endPoint(path: "mypath/\(myParameter)")

            case .otherRequest(let otherParameter):

                return router.endPoint(path: "otherPath", method: .POST, parameters: otherParameter)

            case .allPersonalizedRequest(let param):

                return router.endPoint(path: "myPath", method: .PATCH, parameters: ["par" : param], encoding: .JSON, headers: [["Content-type": "json"]])

        }

    }

}
```

### Use it with Alamofire
```swift
Alamofire.request(MyAPI.myRequest(myParameter: "aValue")).response { resp in 

	// Do some stuff

}
```

### Use it with [AlamofireUIManager](http://https://cocoapods.org/pods/AlamofireUIManager)
```swift

let netManager = AlamofireUIManager.sharedInstance

netManager.request(MyAPI.myRequest(myParameter: "aValue"), completionHandler: { json in
	
	// Do some stuff
	
})

```

## Author

Alex Corlatti, alex.corlatti@gmail.com

## License

AlamofireRouter is available under the MIT license. See the LICENSE file for more info.
