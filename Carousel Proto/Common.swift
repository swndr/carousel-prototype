//
//  Common.swift
//
//  Created by Timothy Lee on 10/21/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import Foundation
import UIKit

func CGAffineTransformMakeDegreeRotation(rotation: CGFloat) -> CGAffineTransform {
    return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 180))
}

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
    let ratio = (r2Max - r2Min) / (r1Max - r1Min)
    return value * ratio + r2Min - r1Min * ratio
}

func convertValueScreenHeight(value: CGFloat, rMin: CGFloat, rMax: CGFloat) -> CGFloat {
    let max = UIScreen.mainScreen().bounds.size.height
    let ratio = (rMax - rMin) / (max - 0)
    if value < max {
        return value * ratio + rMin - 0 * ratio
    } else {
        return rMax // rollover not elastic
    }
}

func setTileStartPosition(tile:UIImageView,w:CGFloat,h:CGFloat,x:CGFloat,y:CGFloat,scale:CGFloat,rotation:CGFloat) -> UIImageView {
    tile.frame = CGRect(x: x, y: y, width: w, height: h)
    tile.transform = CGAffineTransformMakeDegreeRotation(rotation)
    tile.transform = CGAffineTransformScale(tile.transform, scale, scale)
    tile.clipsToBounds = false
    return tile
}

