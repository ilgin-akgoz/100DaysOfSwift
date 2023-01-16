//
//  DetailViewController.swift
//  Project 16 - Capital Cities
//
//  Created by Ilgın Akgöz on 16.01.2023.
//

import WebKit
import UIKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    var selectedURL: String?
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlToLoad = selectedURL {
            let url = URL(string: urlToLoad)!
            webView.load(URLRequest(url: url))
        }
    }
 
}
