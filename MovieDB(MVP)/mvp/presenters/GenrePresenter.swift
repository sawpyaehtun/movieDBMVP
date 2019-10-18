//
//  GenrePresenter.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
protocol GenrePresenter {
    func onAttach(view : GenreView)
    func onUIReady()
}
