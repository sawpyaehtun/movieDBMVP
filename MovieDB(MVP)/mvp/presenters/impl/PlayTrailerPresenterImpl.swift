//
//  PlayTrailerPresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

class PlayTrailerPresenterImpl: BasePresenter {
    var mView : PlayTrailerView? = nil
//    var mView : PlayTrailerView? = nil
}

extension PlayTrailerPresenterImpl : PlayTrailerPresenter {
    func onAttach(view: PlayTrailerView) {
        mView = view
    }
    
    func onUIReady(movieId : Int) {
        getTrillerVideos(movieId: movieId)
    }
    
}

extension PlayTrailerPresenterImpl {
    func getTrillerVideos(movieId : Int) {
        mView?.startLoading()
        VideoModelImpl.shared.getTrailerVideos(movieId: movieId, success: { (trillerVideos) in
            self.mView?.finishLoading()
            self.mView?.playTrailer(trailerList: trillerVideos)
        }) { (error) in
            self.mView?.showError(errorMessage: error)
        }
    }
}
