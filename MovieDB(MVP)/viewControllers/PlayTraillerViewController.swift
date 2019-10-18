//
//  PlayTraillerViewController.swift
//  MovieAsignWithRealm
//
//  Created by saw pyaehtun on 05/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import WebKit

class PlayTraillerViewController: BaseViewController {
    
    @IBOutlet weak var wkWebView: WKWebView!
    
    var movieID : Int = 0
    var playTrailerPresenterImpl = PlayTrailerPresenterImpl()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpPresenter() {
        playTrailerPresenterImpl.onAttach(view: self)
        playTrailerPresenterImpl.onUIReady(movieId: movieID)
    }
    
    private func playTriller(key : String){
        //        let myURL = URL(string: "https://www.youtube.com/watch?v=\(key)")
        let myURL = URL(string: "https://www.youtube.com/embed/\(key)")
        let youtubeRequest = URLRequest(url: myURL!)
        wkWebView.load(youtubeRequest)
    }
    
    
    override func setUpUIs() {
        super.setUpUIs()
        self.view.isUserInteractionEnabled = true
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(closeThis))
        self.view.addGestureRecognizer(tapGestureRecogniser)
        wkWebView.navigationDelegate = self
    }
    
    @objc func closeThis(){
        hl_removeFromParentViewController(moveupAnimation: true)
    }
    
}

extension PlayTraillerViewController : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideLoading()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showLoading()
    }
}


//MARK:- Display Views
extension PlayTraillerViewController : PlayTrailerView{
    func playTrailer(trailerList: [VideoVO]) {
        if !trailerList.isEmpty{
            playTriller(key: trailerList.first!.key!)
        }
    }
    
    func startLoading() {
        showLoading()
    }
    
    func finishLoading() {
        hideLoading()
    }
    
    func showError(errorMessage: String) {
        displayError(errorMessage: errorMessage)
    }
    
    
}
