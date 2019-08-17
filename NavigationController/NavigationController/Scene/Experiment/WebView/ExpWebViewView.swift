import Foundation
import UIKit
import WebKit

class ExpWebViewView: UIView {
    
    let urlWebView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    let webButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Press here", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .gray
        addSubview(urlWebView)
        addSubview(webButton)
    }
    
    private func setupConstraints() {
        urlWebView.anchor(top: safeAreaLayoutGuide.topAnchor,
                          left: leftAnchor,
                          bottom: webButton.topAnchor,
                          right: rightAnchor,
                          paddingTop: 20,
                          paddingBottom: 20)
        
        webButton.anchor(left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: 16,
                         paddingBottom: 16,
                         paddingRight: 16,
                         height: 52)
        
    }
    
    
}
