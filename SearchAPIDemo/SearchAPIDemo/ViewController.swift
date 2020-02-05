//
//  ViewController.swift
//  SearchAPIDemo
//
//  Created by Hamish Bultitude on 29/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var search = Search()
    
    @IBOutlet weak var searchBox: UITextField!
    
    @IBOutlet weak var textView: UILabel!
    
    @IBAction func goButton(_ sender: UIButton) {
        if let term = searchBox.text {
            print("FOUND: \(term)")
            let foundText = Search.downloadJson(for: term, by: "")
            
//            print(foundText)
            textView.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            textView.text = foundText
            print("hello")
            print(textView.text ?? "nothing :(")
        }
    }
    
    @IBAction func searchAction(_ sender: UITextField) {
        
        
    }
    
}

