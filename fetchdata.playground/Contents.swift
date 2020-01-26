//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = .white

        
        let term = "vodka"
        let order = "score_desc"
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
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
