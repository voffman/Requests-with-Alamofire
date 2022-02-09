//
//  ViewController.swift
//  Af
//
//  Created by Владимир Свиридов on 08.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let urlString = "https://jsonplaceholder.typicode.com/posts"
    let body: [String : Any] = [
                                "title": "Test Topic",
                                "body": "Request with using Alamofire"]
    
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getRequest(url: urlString, headers: [], model: Placeholder.self) { post in
            print(post.id ?? "No data")
            print(post.title)
        }
        
        networkManager.postRequest(url: urlString, headers: [], body: body, model: Placeholder.self) { posts in
            print(posts.title)
        }
        
    }
}
