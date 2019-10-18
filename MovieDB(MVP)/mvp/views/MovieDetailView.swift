//
//  MovieDetailView.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol MovieDetailView : BaseView{
    func showSimilarMovies(movieList : [MovieVO])
    func showMovieDetail(movie : MovieVO)
    func showAddWatchListBtn(isAdded : Bool)
    func showRateBtn(isAdded : Bool)
}
