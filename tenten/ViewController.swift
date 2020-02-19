//
//  ViewController.swift
//  tenten
//
//  Created by Fatfat on 16/2/2020.
//  Copyright © 2020 Fatfat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var stack: UIStackView!
    @IBOutlet var choice: [UIStackView]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gg: UIView!
    @IBOutlet weak var `switch`: UISwitch!
    
    var origin: [CGPoint] = Array(repeating: CGPoint.zero, count: 3)
    var score = 0
    var easyMode: Bool = true;
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
            let v = stack.subviews[y].subviews[x]
            return v
        }
        else {
            return nil
        }
    }
    
    func genIfNeed(_ forced: Bool) {
        var flag = true
        for v in choice {
            flag = flag && v.isHidden
        }
        if flag || forced {
            for v in self.choice {
                for row in v.subviews {
                    for col in row.subviews {
                        col.backgroundColor = self.color[0]
                    }
                }
            }
            repeat {
                print("gening")
                for v in self.choice {
                    let r = self.randomNumber(probabilities: self.chance)
                    for co in self.pieces[r] {
                        let x = co[0]
                        let y = co[1]
                        v.subviews[y].subviews[x].backgroundColor = self.color[r + 1]
                    }
                    print(r)
                }
                print("VALID ", self.checkAllPossible(false))
            } while false && self.easyMode && (self.checkAllPossible(false) < 3)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                for v in self.choice {
                    v.isHidden = false
                }
            }, completion: nil)
        }
    }
    
    func checkAnyPossible(_ ignoreHidden: Bool) -> Int {
        var valid = 0
        outloop: for i in 0...2 {
            if choice[i].isHidden && ignoreHidden {
                continue
            }
            for x in 0...9 {
                for y in 0...9 {
                    if checkFail(choice[i], x, y) == 0 {
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
            if choice[i].isHidden && ignoreHidden {
                continue
            }
            outloop: for x in 0...9 {
                for y in 0...9 {
                    if checkFail(choice[i], x, y) == 0 {
                        valid += 1
                        break outloop
                    }
                }
            }
        }
        return valid
    }
    
    func reset() {
        score = 0
        scoreLabel.text = "\(score)"
        for item in choice {
            for row in item.subviews {
                for col in row.subviews {
                    col.backgroundColor = color[0]
                    col.layer.cornerRadius = 5.0
                }
            }
        }
        for row in stack.subviews {
            for col in row.subviews {
                col.backgroundColor = color[0]
                col.layer.borderColor = UIColor.lightGray.cgColor
                col.layer.borderWidth = 1.0
                col.layer.cornerRadius = 5.0
            }
        }
        genIfNeed(true)
    }
    
    @objc func itemDidMove(_ recognizer:UIPanGestureRecognizer) {
        
        guard let gestureView = recognizer.view as? UIStackView else {
            return
        }
        let translation = recognizer.translation(in: gestureView.superview)
        let size = stack.subviews[0].subviews[0].frame.height
        let spacing = (stack.subviews[0] as! UIStackView).spacing

        if recognizer.state == UIGestureRecognizer.State.began {
            for constraint in gestureView.constraints {
                if constraint.identifier == "ww" || constraint.identifier == "hh" {
                   constraint.constant = size*5+spacing*4
                }
            }
            gestureView.spacing = spacing
            for case let v as UIStackView in gestureView.subviews {
                v.spacing = spacing
            }
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
                self.origin[gestureView.tag] = gestureView.center
                gestureView.layoutIfNeeded()
            }, completion: nil)
        }

        if recognizer.state == UIGestureRecognizer.State.ended {
            let position = gestureView.convert(translation, to: stack)
            print(position)
            
            for constraint in gestureView.constraints {
                if constraint.identifier == "ww" || constraint.identifier == "hh" {
                   constraint.constant = 100
                }
            }
            gestureView.spacing = 4
            for case let v as UIStackView in gestureView.subviews {
                v.spacing = 4
            }
            print(size)
            print(spacing)
            //xcell = floor((position.x-size/2-spacing/2)/(spacing+size))+1
            //print(floor((position.y-size/2-spacing/2)/(spacing+size))+1)
            let xcell = Int(round((position.x)/(spacing+size)))
            let ycell = Int(round((position.y)/(spacing+size)))
            var error = 0
            error = checkFail(gestureView, xcell, ycell)
            if error == 0 {
                // move it back
                gestureView.center = self.origin[gestureView.tag]
                gestureView.layoutIfNeeded()
                
                for i in 0...4 {
                    for j in 0...4 {
                        let c = gestureView.subviews[j].subviews[i].backgroundColor
                        if c != color[0] {
                            if let v = getStack(xcell + i, ycell + j) {
                                v.backgroundColor = c
                            } else {
                                error = 1
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
                scoreLabel.text = "\(score)"
                gestureView.isHidden = true
                
                
                UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
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
                genIfNeed(false)
                let valid = checkAnyPossible(true)
                if valid == 0 {
                    gg.isHidden = false
                }
            } else {
                // move it back
                UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
                    gestureView.center = self.origin[gestureView.tag]
                    gestureView.layoutIfNeeded()
                }, completion: nil)
            }
        }

        if recognizer.state == UIGestureRecognizer.State.changed {
            gestureView.center = CGPoint(
              x: gestureView.center.x + translation.x,
              y: gestureView.center.y + translation.y
            )
            recognizer.setTranslation(CGPoint.zero, in: gestureView.superview)
        } else {
            // or something when its not moving
        }
    }
    
    @objc func clickGG(_ gestureRecognizer: UITapGestureRecognizer) {
        gg.isHidden = true
        reset()
    }
    
    @objc func switchEasy(_ mySwitch: UISwitch) {
        easyMode = mySwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for item in choice {
            let panRegcognizer = UIPanGestureRecognizer(target: self, action: #selector(itemDidMove(_:)))
            item.addGestureRecognizer(panRegcognizer)
        }
        gg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickGG(_:))))
        `switch`.addTarget(self, action: #selector(switchEasy(_:)), for: UIControl.Event.valueChanged)

        reset()
        
    }


}

