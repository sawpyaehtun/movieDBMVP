//
//  GenreModel.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 16/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol GenreModel {
    func fetchGeners(success : @escaping ([GenreVO]) -> Void,
                     failure: @escaping (String) -> Void)
    
    func saveToRealm(genreVO : GenreVO)
    
    func saveToRealm(genreVOs : [GenreVO])
    
    func getGenreList(success : @escaping ([GenreVO]) -> Void)
    
    func getGenreROByID(genreId : Int) -> GenreRO?
}
