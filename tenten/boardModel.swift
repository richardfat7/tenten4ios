//
//  boardModel.swift
//  tenten
//
//  Created by Fatfat on 17/2/2020.
//  Copyright © 2020 Fatfat. All rights reserved.
//

import CoreGraphics

struct Piece {
    var pos: [CGPoint]
}

struct board {
    var grid: [Int]
    var bag: [Piece]
}
