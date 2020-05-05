//
//  ViewController.swift
//  tenten
//
//  Created by Fatfat on 16/2/2020.
//  Copyright © 2020 Fatfat. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
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
    //IB
    @IBOutlet weak var VGrid: UIStackView!
    @IBOutlet var VBag: [UIStackView]!
    @IBOutlet weak var LScore: UILabel!
    @IBOutlet weak var VGG: UIView!
    @IBOutlet weak var SHandicap: UISwitch!
    @IBOutlet var topSpace: [NSLayoutConstraint]!
    @IBOutlet var rightHorizontal: [NSLayoutConstraint]!
    
    // Variables
    var engine = GameEngine()
    var origin = Array(repeating: CGPoint.zero, count: 3)
    var offset = Array(repeating: CGPoint.zero, count: 3)
    var initTouch = Array(repeating: CGPoint.zero, count: 3)
    var isMoving = Array(repeating: false, count: 3)
    
    func randomNumber(probabilities: [Double]) -> Int {
        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, +)
        // Random number in the range 0.0 <= rnd < sum :
        let rnd = Double.random(in: 0.0 ..< sum)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return i
            }
        }
        // This point might be reached due to floating point inaccuracies:
        return (probabilities.count - 1)
    }
    
    func checkFail(_ gestureView: UIView, _ xcell: Int, _ ycell: Int) -> Int {
        var error = 0
        for i in 0...4 {
            for j in 0...4 {
                let c = gestureView.subviews[j].subviews[i].backgroundColor
                if c != color[0] {
                    if let v = getStack(xcell + i, ycell + j) {
                        if v.backgroundColor != color[0] {
                            error = 1
                        }
                    } else {
                        error = 1
                    }
                }
            }
        }
        return error
    }
    
    func getStack(_ x: Int, _ y: Int) -> UIView? {
        if x >= 0 && x <= 9 && y >= 0 && y <= 9 {
            let v = VGrid.subviews[y].subviews[x]
            return v
        }
        else {
            return nil
        }
    }
    
    func genIfNeed(_ forced: Bool) {
        var flag = true
        for v in VBag {
            flag = flag && v.isHidden
        }
        if flag || forced {
            for v in self.VBag {
                for row in v.subviews {
                    for col in row.subviews {
                        col.backgroundColor = self.color[0]
                    }
                }
            }
            repeat {
                print("gening")
                for v in self.VBag {
                    let r = self.randomNumber(probabilities: self.chance)
                    for co in self.pieces[r] {
                        let x = co[0]
                        let y = co[1]
                        v.subviews[y].subviews[x].backgroundColor = self.color[r + 1]
                    }
                    print(r)
                }
                print("VALID ", self.checkAllPossible(false))
            } while false && self.handicap && (self.checkAllPossible(false) < 3)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                for v in self.VBag {
                    v.isHidden = false
                }
            }, completion: nil)
        }
    }
    
    func checkAnyPossible(_ ignoreHidden: Bool) -> Int {
        var valid = 0
        outloop: for i in 0...2 {
            if VBag[i].isHidden && ignoreHidden {
                continue
            }
            for x in 0...9 {
                for y in 0...9 {
                    if checkFail(VBag[i], x, y) == 0 {
                        valid = 1
                        break outloop
                    }
                }
            }
        }
        return valid
    }
    
    func checkAllPossible(_ ignoreHidden: Bool) -> Int {
        var valid = 0
        for i in 0...2 {
            if VBag[i].isHidden && ignoreHidden {
                continue
            }
            outloop: for x in 0...9 {
                for y in 0...9 {
                    if checkFail(VBag[i], x, y) == 0 {
                        valid += 1
                        break outloop
                    }
                }
            }
        }
        return valid
    }
    
    func dfsAllPossible(_ index: Int) -> Bool {
        for x in 0...9 {
            for y in 0...9 {
                
            }
        }
        return true
    }
    
    func reset() {
        score = 0
        LScore.text = "\(score)"
        for item in VBag {
            for row in item.subviews {
                for col in row.subviews {
                    col.backgroundColor = color[0]
                    col.layer.cornerRadius = 5.0
                }
            }
        }
        for row in VGrid.subviews {
            for col in row.subviews {
                col.backgroundColor = color[0]
                col.layer.borderColor = UIColor.lightGray.cgColor
                col.layer.borderWidth = 1.0
                col.layer.cornerRadius = 5.0
            }
        }
        genIfNeed(true)
    }
    
    func doMove(_ gestureView: UIStackView, _ xcell: Int, _ ycell: Int, _ duration: Double) {
        for i in 0...4 {
            for j in 0...4 {
                let c = gestureView.subviews[j].subviews[i].backgroundColor
                if c != color[0] {
                    if let v = getStack(xcell + i, ycell + j) {
                        v.backgroundColor = c
                    }
                }
            }
        }
        var clearedx: [Int] = []
        var clearedy: [Int] = []
        for i in 0...9 {
            var full = true
            for j in 0...9 {
                if let v = getStack(i, j) {
                    if v.backgroundColor == color[0] {
                        full = full && false
                    }
                }
            }
            if full {
                clearedx.append(i)
            }
        }
        for i in 0...9 {
            var full = true
            for j in 0...9 {
                if let v = getStack(j, i) {
                    if v.backgroundColor == color[0] {
                        full = full && false
                    }
                }
            }
            if full {
                clearedy.append(i)
            }
        }
        print(clearedx, clearedy)
        let ncleared = clearedx.count + clearedy.count
        score += ncleared * (ncleared + 1) * 10
        LScore.text = "\(score)"
        gestureView.isHidden = true
        
        UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            for i in clearedx {
                for j in 0...9 {
                    self.getStack(i, j)?.backgroundColor = self.color[0]
                }
            }
            for i in clearedy {
                for j in 0...9 {
                    self.getStack(j, i)?.backgroundColor = self.color[0]
                }
            }
        }, completion: nil)
    }
    

    @objc func itemDidLongPress(_ recognizer:UILongPressGestureRecognizer) {
        guard let gestureView = recognizer.view as? UIStackView else {
            return
        }
        let size = VGrid.subviews[0].subviews[0].frame.height
        let spacing = (VGrid.subviews[0] as! UIStackView).spacing
        let center = gestureView.center
        let location = recognizer.location(in: gestureView.superview)
        let tag = gestureView.tag
        
        if recognizer.state == UIGestureRecognizer.State.began {
            let csize = gestureView.subviews[0].subviews[0].frame.height
            let cspacing = (gestureView.subviews[0] as! UIStackView).spacing
            let xcell = max(min(Int(floor((location.x - center.x + 50 + cspacing / 2)/(cspacing+csize))), 4), 0)
            let ycell = max(min(Int(floor((location.y - center.y + 50 + cspacing / 2)/(cspacing+csize))), 4), 0)
            if gestureView.subviews[ycell].subviews[xcell].backgroundColor != color[0] {
                self.isMoving[tag] = true
                self.origin[tag] = gestureView.center
                
                self.initTouch[tag] = location
                
                self.offset[tag] = CGPoint(
                    x: (location.x - center.x) * (size*5+spacing*4-100)/100,
                    y: (location.y - center.y) * (size*5+spacing*4-100)/100)
                for constraint in gestureView.constraints {
                    if constraint.identifier == "ww" || constraint.identifier == "hh" {
                       constraint.constant = size*5+spacing*4
                    }
                }
                gestureView.spacing = spacing
                for case let v as UIStackView in gestureView.subviews {
                    v.spacing = spacing
                }
                topSpace[tag].constant = view.convert(
                    CGPoint(
                    x: origin[tag].x + location.x - initTouch[tag].x - offset[tag].x,
                    y: origin[tag].y + location.y - initTouch[tag].y - offset[tag].y
                    ), to: VGrid).y - VGrid.frame.height
                rightHorizontal[tag].constant = origin[tag].x + location.x - initTouch[tag].x - offset[tag].x - view.frame.width/2
                
                UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
                    gestureView.layoutIfNeeded()
                }, completion: nil)
            }
        } else if recognizer.state == UIGestureRecognizer.State.ended {
            if self.isMoving[tag] {
                self.isMoving[tag] = false
                let position = gestureView.convert(CGPoint.zero, to: VGrid)
                
                
                for constraint in gestureView.constraints {
                    if constraint.identifier == "ww" || constraint.identifier == "hh" {
                       constraint.constant = 100
                    }
                }
                gestureView.spacing = 4
                for case let v as UIStackView in gestureView.subviews {
                    v.spacing = 4
                }
                
                topSpace[tag].constant = 100
                rightHorizontal[tag].constant = [-120, 0, 120][tag]
                
                //xcell = floor((position.x-size/2-spacing/2)/(spacing+size))+1
                //print(floor((position.y-size/2-spacing/2)/(spacing+size))+1)
                let xcell = Int(round((position.x)/(spacing+size)))
                let ycell = Int(round((position.y)/(spacing+size)))
                var error = 0
                error = checkFail(gestureView, xcell, ycell)
                if error == 0 {
                    // move it back
                    gestureView.center = self.origin[tag]
                    gestureView.layoutIfNeeded()
                    
                    doMove(gestureView, xcell, ycell, 0.3)
                    genIfNeed(false)
                    let valid = checkAnyPossible(true)
                    if valid == 0 {
                        VGG.isHidden = false
                    }
                } else {
                    // move it back
                    UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
                        gestureView.center = self.origin[tag]
                        gestureView.layoutIfNeeded()
                    }, completion: nil)
                }
            }
        } else if recognizer.state == UIGestureRecognizer.State.changed {
            if self.isMoving[tag] {
                gestureView.center = CGPoint(
                    x: origin[tag].x + location.x - initTouch[tag].x - offset[tag].x,
                    y: origin[tag].y + location.y - initTouch[tag].y - offset[tag].y
                )
            }
        } else {
            // or something when its not moving
        }
    }
    
    @objc func clickGG(_ gestureRecognizer: UITapGestureRecognizer) {
        VGG.isHidden = true
        reset()
    }
    
    @objc func switchEasy(_ mySwitch: UISwitch) {
        handicap = mySwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for item in VBag {
            //let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(itemDidMove(_:)))
            //item.addGestureRecognizer(panRecognizer)
            let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(itemDidLongPress(_:)))
            longPressRecognizer.minimumPressDuration = 0.0
            longPressRecognizer.allowableMovement = CGFloat.infinity
            item.addGestureRecognizer(longPressRecognizer)
        }
        VGG.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickGG(_:))))
        SHandicap.addTarget(self, action: #selector(switchEasy(_:)), for: UIControl.Event.valueChanged)

        reset()
        
    }


}

