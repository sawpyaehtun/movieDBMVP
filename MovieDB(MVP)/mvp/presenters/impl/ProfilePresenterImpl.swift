//
//  ProfilePresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

class ProfilePresenterImpl: BasePresenter {
    var mView : ProfileView? = nil
}

extension ProfilePresenterImpl : ProfilePresenter {
   
    func onAttach(view: ProfileView) {
        mView = view
    }
    
    func onUIReady() {
        getRatedMovies()
        getWatchListMovie()
    }
    
}

extension ProfilePresenterImpl {
    func getWatchListMovie() {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            let movieList = UserModelImpl.shared.getwatchListMovieFromRealm()
            mView?.showWatchListMovie(movieList: movieList)
        } else {
            UserModelImpl.shared.getWatchListMovies(success: { (movieList) in
                self.mView?.finishLoading()
                self.mView?.showWatchListMovie(movieList: movieList)
            }) { (err) in
                self.mView?.showError(errorMessage: err)
            }
        }
        
    }
    
    func getRatedMovies() {
       mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            mView?.finishLoading()
            let movieList = UserModelImpl.shared.getRatedListMovieFromRealm()
            mView?.showRatedListMovie(movieList: movieList)
        } else {
            UserModelImpl.shared.getRatedMovie(success: { (movielist) in
                self.mView?.finishLoading()
                self.mView?.showRatedListMovie(movieList: movielist)
            }) { (err) in
                self.mView?.showError(errorMessage: err)
                print(err)
            }
        }
        
    }
}
