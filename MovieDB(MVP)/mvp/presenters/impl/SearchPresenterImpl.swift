//
//  SearchPresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
class SearchPresenterImpl: BasePresenter {
    var mView : SearchView? = nil
}

extension SearchPresenterImpl : SearchPresenter {
    func onAttach(view: SearchView) {
        mView = view
    }
    
    func onUIReady() {
        
    }
    
    func searchMovie(name: String) {
        mView?.startLoading()
        MovieModelimpl.shared.searchMovie(movieName: name, success: { (movieResult) in
            self.mView?.finishLoading()
            self.mView?.showSearchMovieResult(movieList: movieResult)
        }) { (error) in
            self.mView?.showError(errorMessage: error)
        }
    }
}
