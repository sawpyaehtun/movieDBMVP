//
//  CategoryModel.swift
//  MovieDB(MVP)
//
//  Created by saw pyaehtun on 17/10/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation

protocol CategoryModel {
    func getCategoryROByID(categoryID : Int) -> CategoryRO
}
