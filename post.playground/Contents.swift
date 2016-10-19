//: Playground - noun: a place where people can play

import UIKit

let authUrl = "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13/"
let scope = "http://api.microsofttranslator.com"
let grantType = "client_credentials"
let clientSecret = "+WwCg2dTHVGJSgIsWetAgf5IcZkkO3yJRmqunedcxBM="
let clientId = "8a131119237719c9b456e667bc803cbd"



let params = "client_id=8a131119237719c9b456e667bc803cbd&client_secret=%2BWwCg2dTHVGJSgIsWetAgf5IcZkkO3yJRmqunedcxBM%3D&scope=http%3A%2F%2Fapi.microsofttranslator.com&grant_type=client_credentials"


let url = URL(string: authUrl)
var request = URLRequest(url: url!)

request.httpMethod = "POST"
request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
request.httpBody = params.data(using: .utf8)

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    print("kim")
}

task.resume()

print("hello")


