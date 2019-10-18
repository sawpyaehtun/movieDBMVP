//
//  MoviePresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

class MoviePresenterImpl: BasePresenter {
    var mView : MovieView? = nil
}

extension MoviePresenterImpl : MoviePresenter {
    func onAttach(view: MovieView) {
        mView = view
    }
    
    func onUIReady() {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            let movieList = MovieModelimpl.shared.getMovie()
            mView?.diaplayMovies(movieList: movieList)
        } else {
            MovieModelimpl.shared.fetchAllmovie(success: { movieList in
                self.mView?.finishLoading()
                self.mView?.diaplayMovies(movieList: movieList)
            }) { (err) in
                print(err)
            }
        }
    }
    
}
