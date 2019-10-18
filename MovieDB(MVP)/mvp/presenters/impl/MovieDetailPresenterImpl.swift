//
//  MovieDetailPresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

class MovieDetailPresenterImpl: BasePresenter {
    var mView : MovieDetailView? = nil
    let internetConnectionError = "Please Check Your Internet Connection!"
    let loginFirstMessage = "Please Login First"
}

extension MovieDetailPresenterImpl : MovieDetailPresenter {
    
    func onAttach(view: MovieDetailView) {
        mView = view
    }
    
    func onUIReady(movieID : Int) {
        getMovieDetail(movieId: movieID)
        getSimilarMovie(movieId: movieID)
        getMovieAndCheckInRatedList(movieID: movieID)
        getMovieAndCheckInWatchList(movieID: movieID)
    }
    
    func addToWatchListMovie(movieID: Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.showError(errorMessage: internetConnectionError)
        } else {
            UserModelImpl.shared.addToWatchListMovie(movieID: movieID, success: {
                self.mView?.finishLoading()
                self.mView?.showAddWatchListBtn(isAdded: true)
            }) { (err) in
                self.mView?.showError(errorMessage: self.loginFirstMessage)
            }
        }
    }
    
    func removeFromWatchListMovie(movieID: Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.showError(errorMessage: internetConnectionError)
        } else {
            UserModelImpl.shared.removeFromWatchListMovie(movieID: movieID, success: {
                self.mView?.finishLoading()
                self.mView?.showAddWatchListBtn(isAdded: false)
            }) { (err) in
                self.mView?.showError(errorMessage: self.loginFirstMessage)
            }
        }
    }
    
    func addToRatedListMovie(movieID: Int,value : Double) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.showError(errorMessage: internetConnectionError)
        } else {
            UserModelImpl.shared.addMovieToRatedList(movieID: movieID, value: value, success: {
                self.mView?.finishLoading()
                self.mView?.showRateBtn(isAdded: true)
            }) { (err) in
                self.mView?.showError(errorMessage: self.internetConnectionError)
            }
        }
    }
    
    func removeFromRatedListMovie(movieID: Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.showError(errorMessage: internetConnectionError)
        } else {
            UserModelImpl.shared.removeMovieFromRatedList(movieID: movieID, success: {
                self.mView?.finishLoading()
                self.mView?.showRateBtn(isAdded: false)
            }) { (err) in
                print(err)
                self.mView?.showError(errorMessage: self.internetConnectionError)
            }
        }
    }
}

extension MovieDetailPresenterImpl {
    private func getSimilarMovie(movieId : Int) {
        mView?.startLoading()
        MovieModelimpl.shared.getSimilarMovie(movieId: movieId, success: { (movieList) in
            self.mView?.finishLoading()
            self.mView?.showSimilarMovies(movieList: movieList)
        }) { (error) in
            self.mView?.showError(errorMessage: error)
        }
    }
    
    private func getMovieAndCheckInWatchList(movieID : Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            let movieList = getMovieWatchListFromRealm()
            checkMovieInWatchList(movieID: movieID, movieWatchList: movieList)
        } else {
            UserModelImpl.shared.getWatchListMovies(success: { (movieList) in
                self.mView?.finishLoading()
                self.checkMovieInWatchList(movieID: movieID, movieWatchList: movieList)
            }) { (err) in
                print(err)
                self.mView?.showError(errorMessage: err)
            }
        }
    }
    
    private func getMovieWatchListFromRealm() -> [MovieVO]{
        return UserModelImpl.shared.getwatchListMovieFromRealm()
    }
    
    private func getRatedMovieListFromRealm() -> [MovieVO]{
        return UserModelImpl.shared.getRatedListMovieFromRealm()
    }
    
    private func checkMovieInWatchList(movieID : Int,movieWatchList : [MovieVO]){
        if !movieWatchList.isEmpty {
            let idArray = movieWatchList.map { (movie) -> Int in
                return movie.id ?? 0
            }
            if idArray.contains(movieID) {
                mView?.showAddWatchListBtn(isAdded: true)
            } else {
                mView?.showAddWatchListBtn(isAdded: false)
            }
        }
    }
    
    private func getMovieAndCheckInRatedList(movieID : Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            let movieList = getRatedMovieListFromRealm()
            checkMovieInRatedList(movieID: movieID, ratedMovieList: movieList)
        } else {
            UserModelImpl.shared.getRatedMovie(success: { (movielist) in
                self.mView?.finishLoading()
                self.checkMovieInRatedList(movieID: movieID, ratedMovieList: movielist)
            }) { (err) in
                print(err)
                self.mView?.showError(errorMessage: err)
            }
        }
        
    }
    
    private func checkMovieInRatedList(movieID : Int, ratedMovieList : [MovieVO]){
        if !ratedMovieList.isEmpty {
            let idArray = ratedMovieList.map { (movie) -> Int in
                return movie.id ?? 0
            }
            
            if idArray.contains(movieID){
                mView?.showRateBtn(isAdded: true)
            } else {
                mView?.showRateBtn(isAdded: false)
            }
        }
    }
    
    private func getMovieDetail(movieId : Int) {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            mView?.showMovieDetail(movie: MovieModelimpl.shared.getMovieVOById(movieID: movieId))
        } else {
            MovieModelimpl.shared.getMovieDetail(movieId: movieId, success: { (movie) in
                self.mView?.finishLoading()
                self.mView?.showMovieDetail(movie: movie)
            }) { (error) in
                self.mView?.showError(errorMessage: error)
            }
        }
    }
}
