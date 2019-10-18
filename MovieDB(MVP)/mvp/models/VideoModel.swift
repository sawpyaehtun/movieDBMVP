//
//  VideoModel.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 17/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol VideoModel {
    func getTrailerVideos(movieId : Int,
                          success : @escaping ([VideoVO]) -> Void,
                          faulire : @escaping (String) -> Void)
}
