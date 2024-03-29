//
//  UICollectionView+Extension.swift
//  Movie
//
//  Created by saw pyaehtun on 26/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID)
    }
}
