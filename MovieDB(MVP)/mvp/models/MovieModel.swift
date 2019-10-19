//
//  MovieModel.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol MovieModel {
    func getMovieDetail(movieId : Int,
                        success : @escaping (MovieVO) -> Void,
                        faulire : @escaping (String) -> Void)
        
        func getSimilarMovie(pageId : Int,
                             movieId : Int,
                             success : @escaping ([MovieVO]) -> Void,
                             faulire : @escaping (String) -> Void)
        
        func searchMovie(movieName : String,
                         success : @escaping ([MovieVO]) -> Void,
                         faulire : @escaping (String) -> Void)
        
        func fetchAllmovie(success : @escaping ([MovieVO]) -> Void,
                           faulire: @escaping (String) -> Void)
        
        func fetchTopRatedMovie(pageId : Int,
                                success : @escaping () -> Void,
                                faulire: @escaping (String) -> Void)
        
        func fetchNowPlayingMovie(pageId : Int,
                                  success : @escaping () -> Void,
                                  faulire: @escaping (String) -> Void)
        
        func fetchPopularMovie(pageId : Int,
                               success : @escaping () -> Void,
                               faulire: @escaping (String) -> Void)
        
        func fetchUpcomingMovie(pageId : Int,
                                success : @escaping () -> Void,
                                faulire: @escaping (String) -> Void)
        
        func updateMovie(movieRO : MovieRO, dictionary : [String : Any?])
        
        func getMovie()-> [MovieVO]
        
        func saveToRealm(movieVO : MovieVO)
        
        func saveToRealm(movieVOs : [MovieVO])
        
        func getMovieROById(movieID : Int) -> MovieRO?
        
        func getMovieVOById(movieID : Int) -> MovieVO?
        
        func getMovieVOsByKey(key : String, property : String) -> [MovieVO]
}
