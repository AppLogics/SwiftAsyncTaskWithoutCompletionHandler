//
//  ViewController.swift
//  SwiftAsyncTaskWithoutCompletionHandler
//
//  Created by Sagar Patel on 12/09/2018.
//  Copyright © 2018 AppLogics Solutions Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTouchUpInside(_ sender: Any) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            guard let jsonString = String(data: data, encoding: .utf8) else { return }
            DispatchQueue.main.async {
                self.setResults(text: jsonString);
            }
        }
        task.resume()
    }
    
    func setResults(text: String?){
        textView.text = text;
    }
    
}
