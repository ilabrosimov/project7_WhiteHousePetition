//
//  DetailViewController.swift
//  project7_WhiteHousePetition
//
//  Created by Ilia Abrosimov on 07.07.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailPetition: Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let detailPetition = detailPetition {
            let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial scale=1">
            <style> body {font-size:150%; } </style>
            </head>
            <body>
            \(detailPetition.body)
            </body>
            </html>
            """
            webView.loadHTMLString(html, baseURL: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
