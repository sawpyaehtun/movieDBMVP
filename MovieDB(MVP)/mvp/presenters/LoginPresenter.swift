//
//  LoginPresenter.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol LoginPresenter {
    func onAttach(view : LoginView)
    func onUIReady()
    func login(username : String, password : String)
}
