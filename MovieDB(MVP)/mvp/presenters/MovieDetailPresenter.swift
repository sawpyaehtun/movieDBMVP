//
//  MovieDetailPresenter.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol MovieDetailPresenter {
    func onAttach(view : MovieDetailView)
    func onUIReady(movieID : Int)
    func addToWatchListMovie(movieID : Int)
    func removeFromWatchListMovie(movieID : Int)
    func addToRatedListMovie(movieID : Int,value : Double)
    func removeFromRatedListMovie(movieID : Int)
}
