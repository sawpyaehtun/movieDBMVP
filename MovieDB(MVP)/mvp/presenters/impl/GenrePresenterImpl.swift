//
//  GenrePresenterImpl.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
class GenrePresenterImpl: BasePresenter {
    var mView : GenreView? = nil
}

extension GenrePresenterImpl : GenrePresenter {
    func onAttach(view: GenreView) {
        mView = view
    }
    
    func onUIReady() {
        mView?.startLoading()
        if NetworkClient.checkReachable() == false {
            GenreModelImpl.shared.getGenreList { (genreList) in
                self.mView?.finishLoading()
                self.mView?.showGenreList(genreList: genreList)
            }
        } else {
            GenreModelImpl.shared.fetchGeners(success: { (genreList) in
                self.mView?.finishLoading()
                self.mView?.showGenreList(genreList: genreList)
            }) { (err) in
                self.mView?.showError(errorMessage: err)
            }
        }
        
    }
    
}
