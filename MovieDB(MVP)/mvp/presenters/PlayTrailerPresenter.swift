//
//  PlayTrailerPresenter.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
protocol PlayTrailerPresenter {
    func onAttach(view : PlayTrailerView)
    func onUIReady(movieId : Int)
}
