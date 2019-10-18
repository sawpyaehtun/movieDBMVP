//
//  BaseView.swift
//  MVPProject
//
//  Created by saw pyaehtun on 05/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol BaseView {
    func startLoading()
    func finishLoading()
    func showError(errorMessage : String)
}
