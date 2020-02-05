//
//  Search.swift
//  SearchAPIDemo
//
//  Created by Hamish Bultitude on 29/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import Foundation

class Search {
    static func downloadJson(for term: String, by order: String) -> String{
        var unparsedText = ""
//        var parsedText: String
        
        let order = "score_desc"
        
        let apirequest = "http://comparethebrew.me/api?term=\(term)&order=\(order)"
        print(apirequest)
        let url = URL(string: apirequest)!
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
            if let localURL = localURL {
                if let string = try? String(contentsOf: localURL) {
                    print(string)
                    unparsedText = string
                }
            }
        }

        task.resume()
        
        return unparsedText
    }
    
    
    
}
