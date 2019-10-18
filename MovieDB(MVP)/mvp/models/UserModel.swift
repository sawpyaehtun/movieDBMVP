//
//  UserModel.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol UserModel {
    
    func getNewToken(success : @escaping (LoginAndRequestTokenResponse)-> Void,
                     failure : @escaping (String)-> Void)
    
    func login(userInfoLogin : UserVO,
               success : @escaping () -> Void,
               failure : @escaping (String) -> Void)
    
    func getAccountDetail(success : @escaping () -> Void,
                          failure : @escaping (String) -> Void)
    
    //MARK:- Rate List
    func getRatedMovie(success : @escaping ([MovieVO]) -> Void,
                       failure : @escaping (String) -> Void)
    
    func addMovieToRatedList(movieID : Int,
                             value : Double,
                             success : @escaping () -> Void,
                             failure : @escaping (String) -> Void)
    
    func removeMovieFromRatedList(movieID : Int,
                                  success : @escaping () -> Void,
                                  failure : @escaping (String) -> Void)
    
    
    //MARK:- Watch List
    func getWatchListMovies(success : @escaping ([MovieVO]) -> Void,
                            failure : @escaping (String) -> Void)
    
    
    
    func addToWatchListMovie(movieID : Int,
                             success : @escaping () -> Void,
                             failure : @escaping (String) -> Void)
    
    func removeFromWatchListMovie(movieID : Int,
                                  success : @escaping () -> Void,
                                  failure : @escaping (String) -> Void)
    
    //MARK:- REALM
    func getwatchListMovieFromRealm() -> [MovieVO]
    
    func getRatedListMovieFromRealm() -> [MovieVO]
    
    func addRemoveMovieInWatchList(willAdd : Bool,movieID : Int)
    
    func addRemoveMovieInRatedList(willAdd : Bool, movieID : Int)
}
