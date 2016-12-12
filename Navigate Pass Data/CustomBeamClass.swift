//
//  CustomBeamClass.swift
//  Navigate Pass Data
//
//  Created by steve on 12/11/16.
//  Copyright © 2016 sb. All rights reserved.
//

import UIKit

class CustomBeamClass: NSObject {
    var width: Int = 0
    var depth:Int = 0
    var compressive_Strength: Int = 0

    func update(width:UITextField,depth:UITextField,comp:UITextField){
        if let width = Int(width.text!){
            self.width = width
        }
        if let depth = Int(depth.text!){
            self.depth = depth
        }
        if let comp = Int(comp.text!){
            self.compressive_Strength = comp
        }
    }
}
