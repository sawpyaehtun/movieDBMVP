//
//  LoginPresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

class LoginPresenterImpl: BasePresenter {
    var mView : LoginView? = nil
}

extension LoginPresenterImpl : LoginPresenter {
    func onAttach(view: LoginView) {
        mView = view
    }
    
    func onUIReady() {
        
    }
    
    func login(username: String, password: String) {
        mView?.startLoading()
        UserModelImpl.shared.getNewToken(success: { (loginAndRespnse) in
            let userInfoForLogin = UserVO(username: username, password: password, requestToken: loginAndRespnse.requestToken)
            UserModelImpl.shared.login(userInfoLogin: userInfoForLogin, success: {
                self.mView?.finishLoading()
                self.mView?.loginSuccess()
            }) { (loginError) in
                self.mView?.finishLoading()
                self.mView?.willShowLoginErrorMessage(isHidden: false)
                print("an error occur while login . . . \(loginError)")
            }
        }) { (error) in
            self.mView?.showError(errorMessage: error)
            print("an eror occur while getting new token . . . \(error)")
        }
    }
    
}
