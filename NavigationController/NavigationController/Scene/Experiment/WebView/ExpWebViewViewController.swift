//
//  ExpWebViewViewController.swift
//  NavigationController
//
//  Created by Akingson Chun on 08/08/2019.
//

import UIKit

class ExpWebViewViewController: UIViewController {
    
    private var expWebViewView: ExpWebViewView { return view as! ExpWebViewView }
    
    override func loadView() {
        view = ExpWebViewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com/")
        let urlRequest = URLRequest(url: url!)
        expWebViewView.urlWebView.load(urlRequest)
    }
    
}
