//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by BJIT on 8/12/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://reactnative.dev/movies.json")
            .responseJSON { response in
              //  print(response)
               let data = response.data
                do{
                    let result = try JSONDecoder().decode(MovieObject.self, from: data!)
                    if(result != nil){
                        print(result.title)
                        print(result.movies.count)
                    }
                }catch{
                    print("err: \(error)")
                }
                
                
            }
    }

}

class MovieObject: Codable{
    let title: String!
    let description: String!
    let movies: [Movie]!
}

class Movie: Codable{
    let id: String!
    let title: String!
    let releaseYear: String!
}

