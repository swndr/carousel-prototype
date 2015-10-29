//
//  ViewController.swift
//  Carousel Proto
//
//  Created by Sam Wander on 10/27/15.
//  Copyright © 2015 Sam Wander. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    let t1Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (-30,460,1,-10)
    let t1End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (46,748,1,0)
    
    let t2Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (244,490,1.6,-10)
    let t2End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (201,748,1,0)
    
    let t3Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (210,418,1.4,15)
    let t3End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (200,825,1,0)
    
    let t4Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (134,490,1.6,8)
    let t4End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (46,902,1,0)
    
    let t5Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (0,400,1.6,11)
    let t5End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (123,903,1,0)
    
    let t6Start:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (110,412,1.6,-10)
    let t6End:(x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) = (201,903,1,0)
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = CGSize(width: 320, height: 1136)
        introScrollView.delegate = self
        
        // Tile start positions
        tile1 = setTileStartPosition(tile1,w:153,h:152,x:t1Start.x,y:t1Start.y,scale:t1Start.scale,rotation:t1Start.rotation)
        tile2 = setTileStartPosition(tile2,w:76,h:75,x:t2Start.x,y:t2Start.y,scale:t2Start.scale,rotation:t2Start.rotation)
        tile3 = setTileStartPosition(tile3,w:76,h:75,x:t3Start.x,y:t3Start.y,scale:t3Start.scale,rotation:t3Start.rotation)
        tile4 = setTileStartPosition(tile4,w:76,h:75,x:t4Start.x,y:t4Start.y,scale:t4Start.scale,rotation:t4Start.rotation)
        tile5 = setTileStartPosition(tile5,w:76,h:75,x:t5Start.x,y:t5Start.y,scale:t5Start.scale,rotation:t5Start.rotation)
        tile6 = setTileStartPosition(tile6,w:76,h:75,x:t6Start.x,y:t6Start.y,scale:t6Start.scale,rotation:t6Start.rotation)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollY = Int(round(scrollView.contentOffset.y))

        // Transform tile 1
        let t1x = convertValueScreenHeight(CGFloat(scrollY), rMin: t1Start.x, rMax: t1End.x)
        let t1y = convertValueScreenHeight(CGFloat(scrollY), rMin: t1Start.y, rMax: t1End.y)
        let t1s = convertValueScreenHeight(CGFloat(scrollY), rMin: t1Start.scale, rMax: t1End.scale)
        let t1r = convertValueScreenHeight(CGFloat(scrollY), rMin: t1Start.rotation, rMax: t1End.rotation)
        tile1.frame = CGRect(x: t1x, y: t1y, width: 153, height: 152)
        tile1.transform = CGAffineTransformMakeDegreeRotation(t1r)
        tile1.transform = CGAffineTransformScale(tile1.transform, t1s, t1s)
        
        // Transform tile 2
        let t2x = convertValueScreenHeight(CGFloat(scrollY), rMin: t2Start.x, rMax: t2End.x)
        let t2y = convertValueScreenHeight(CGFloat(scrollY), rMin: t2Start.y, rMax: t2End.y)
        let t2s = convertValueScreenHeight(CGFloat(scrollY), rMin: t2Start.scale, rMax: t2End.scale)
        let t2r = convertValueScreenHeight(CGFloat(scrollY), rMin: t2Start.rotation, rMax: t2End.rotation)
        tile2.frame = CGRect(x: t2x, y: t2y, width: 76, height: 75)
        tile2.transform = CGAffineTransformMakeDegreeRotation(t2r)
        tile2.transform = CGAffineTransformScale(tile2.transform, t2s, t2s)
        
        // Transform tile 3
        let t3x = convertValueScreenHeight(CGFloat(scrollY), rMin: t3Start.x, rMax: t3End.x)
        let t3y = convertValueScreenHeight(CGFloat(scrollY), rMin: t3Start.y, rMax: t3End.y)
        let t3s = convertValueScreenHeight(CGFloat(scrollY), rMin: t3Start.scale, rMax: t3End.scale)
        let t3r = convertValueScreenHeight(CGFloat(scrollY), rMin: t3Start.rotation, rMax: t3End.rotation)
        tile3.frame = CGRect(x: t3x, y: t3y, width: 76, height: 75)
        tile3.transform = CGAffineTransformMakeDegreeRotation(t3r)
        tile3.transform = CGAffineTransformScale(tile3.transform, t3s, t3s)
        
        // Transform tile 4
        let t4x = convertValueScreenHeight(CGFloat(scrollY), rMin: t4Start.x, rMax: t4End.x)
        let t4y = convertValueScreenHeight(CGFloat(scrollY), rMin: t4Start.y, rMax: t4End.y)
        let t4s = convertValueScreenHeight(CGFloat(scrollY), rMin: t4Start.scale, rMax: t4End.scale)
        let t4r = convertValueScreenHeight(CGFloat(scrollY), rMin: t4Start.rotation, rMax: t4End.rotation)
        tile4.frame = CGRect(x: t4x, y: t4y, width: 76, height: 75)
        tile4.transform = CGAffineTransformMakeDegreeRotation(t4r)
        tile4.transform = CGAffineTransformScale(tile4.transform, t4s, t4s)
        
        // Transform tile 5
        let t5x = convertValueScreenHeight(CGFloat(scrollY), rMin: t5Start.x, rMax: t5End.x)
        let t5y = convertValueScreenHeight(CGFloat(scrollY), rMin: t5Start.y, rMax: t5End.y)
        let t5s = convertValueScreenHeight(CGFloat(scrollY), rMin: t5Start.scale, rMax: t5End.scale)
        let t5r = convertValueScreenHeight(CGFloat(scrollY), rMin: t5Start.rotation, rMax: t5End.rotation)
        tile5.frame = CGRect(x: t5x, y: t5y, width: 76, height: 75)
        tile5.transform = CGAffineTransformMakeDegreeRotation(t5r)
        tile5.transform = CGAffineTransformScale(tile5.transform, t5s, t5s)
        
        // Transform tile 6
        let t6x = convertValueScreenHeight(CGFloat(scrollY), rMin: t6Start.x, rMax: t6End.x)
        let t6y = convertValueScreenHeight(CGFloat(scrollY), rMin: t6Start.y, rMax: t6End.y)
        let t6s = convertValueScreenHeight(CGFloat(scrollY), rMin: t6Start.scale, rMax: t6End.scale)
        let t6r = convertValueScreenHeight(CGFloat(scrollY), rMin: t6Start.rotation, rMax: t6End.rotation)
        tile6.frame = CGRect(x: t6x, y: t6y, width: 76, height: 75)
        tile6.transform = CGAffineTransformMakeDegreeRotation(t6r)
        tile6.transform = CGAffineTransformScale(tile6.transform, t6s, t6s)
        
    }
    
    @IBAction func returnToIntro(segue:UIStoryboardSegue) {
        // Issue: after signing out, this unwind will be modal not push
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

