//
//  GameEngine.swift
//  tenten
//
//  Created by Fatfat on 17/2/2020.
//  Copyright © 2020 Fatfat. All rights reserved.
//

import UIKit

struct GameEngine {
    // Const
    let chance = [3/42.0,3/42.0,3/42.0,2/42.0,2/42.0,2/42.0,2/42.0,6/42.0,3/42.0,2/42.0,2/42.0,3/42.0,2/42.0,2/42.0,1/42.0,1/42.0,1/42.0,1/42.0,1/42.0]
    let color = [
        UIColor.clear,
        UIColor.init(red: 106/255.0, green: 90/255.0, blue: 250/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 215/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 215/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 154/255.0, green: 205/255.0, blue: 50/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 140/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 105/255.0, blue: 180/255.0, alpha: 1.0),
        UIColor.init(red: 139/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 140/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 255/255.0, green: 105/255.0, blue: 180/255.0, alpha: 1.0),
        UIColor.init(red: 139/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1.0),
        UIColor.init(red: 0/255.0, green: 191/255.0, blue: 255/255.0, alpha: 1.0),
        UIColor.init(red: 72/255.0, green: 209/255.0, blue: 204/255.0, alpha: 1.0)
    ]
    let pieces = [
        //0
        //[X]
        [[0,0]],

        //1
        //[X][X]
        [[0,0], [0,1]],

        //2
        //[X]
        //[X]
        [[0,0], [1,0]],

        //3
        //[X][X]
        //[X]
        [[0,0], [0,1], [1,0]],

        //4
        //[X][X]
        //   [X]
        [[0,0], [0,1], [1,1]],

        //5
        //[X]
        //[X][X]
        [[0,0], [1,0], [1,1]],

        //6
        //   [X]
        //[X][X]
        [[0,1], [1,0], [1,1]],

        //7
        //[X][X]
        //[X][X]
        [[0,0],[0,1],[1,0],[1,1]],


        //8
        //[X][X][X]
        [[0,0],[0,1],[0,2]],

        //9
        //[X][X][X][X]
        [[0,0],[0,1],[0,2],[0,3]],

        //10
        //[X][X][X][X][X]
        [[0,0],[0,1],[0,2],[0,3],[0,4]],

        //11
        //[X]
        //[X]
        //[X]
        [[0,0],[1,0],[2,0]],

        //12
        //[X]
        //[X]
        //[X]
        //[X]
        [[0,0],[1,0],[2,0],[3,0]],

        //13
        //[X]
        //[X]
        //[X]
        //[X]
        //[X]
        [[0,0],[1,0],[2,0],[3,0],[4,0]],

        //14
        //[X][X][X]
        //[X]
        //[X]
        [[0,0],[0,1],[0,2],[1,0],[2,0]],

        //15
        //[X]
        //[X]
        //[X][X][X]
        [[0,0],[1,0],[2,0],[2,1],[2,2]],

        //16
        //      [X]
        //      [X]
        //[X][X][X]
        [[0,2],[1,2],[2,0],[2,1],[2,2]],

        //17
        //[X][X][X]
        //      [X]
        //      [X]
        [[0,0],[0,1],[0,2],[1,2],[2,2]],

        //18
        //[X][X][X]
        //[X][X][X]
        //[X][X][X]
        [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]

    ]
    
    var grid = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    var bag = Array(repeating: -1, count: 3)
    var bagUsed = Array(repeating: false, count:3)
    var isEnd = false
    var score = 0
    var handicap = true
    
    //weak var delegate = GameEngineDelegate?
    
    init(_ grid: UIStackView? = nil, _ bag: [UIStackView?] = [nil, nil, nil]) {
        //self.VGrid = grid
        //self.VBag = bag
    }
    
    mutating func setGrid(_ x: Int, _ y: Int, _ value: Int) {
        if self.grid[x][y] != value {
            self.grid[x][y] = value
            // Update UI
        }
    }
}

protocol GameEngineDelegate {
    func didFinishDownloading(_ sender: GameEngine)
}
