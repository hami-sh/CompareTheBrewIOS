//
//  FirstViewController.swift
//  CompareTheBrewDemo
//
//  Created by Hamish Bultitude on 10/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import UIKit
import SwiftUI

//MARK: - variables
enum Order: String {
    case score = "score_desc"
    case price = "price_desc"
}

//MARK: - display
struct ContentView : View {
    @State private var term: String = ""
    
    var body: some View {
        VStack {
            TextField("Thirsty?", text: $term)
            Text("Searching for \(term)")
        }
    }
}

//MARK: - api request function
func apiRequest(term: String, order: Order) {
    let apirequest = "http://comparethebrew.me/api?term=\(term)&order=\(order)"
    print(apirequest)
    
    // code to download JSON
    let url = URL(string: apirequest)!
    let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
        if let localURL = localURL {
            if let string = try? String(contentsOf: localURL) {
                print(string)
            }
        }
    }

    task.resume()
}

//MARK: - preview functions
#if DEBUG
struct ContentViews_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
//class FirstViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    override func loadView() {
//        let view = UIView()
//        self.view = view
//        view.backgroundColor = .white
//
//
//
//        let term = "vodka"
//        let order = "score_desc"
//
//    }
//
//}

