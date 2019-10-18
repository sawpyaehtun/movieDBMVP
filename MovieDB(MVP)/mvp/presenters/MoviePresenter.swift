//
//  MoviePresenter.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol MoviePresenter {
    func onAttach(view : MovieView)
    func onUIReady()
}
