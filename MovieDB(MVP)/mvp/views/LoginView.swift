//
//  LoginView.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol LoginView : BaseView{
    func willShowLoginErrorMessage (isHidden : Bool)
    func loginSuccess()
}
