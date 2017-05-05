//
//  ColorCtrlViewController.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 03/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import Foundation
import UIKit

class BaseCtrlViewController: UIViewController{
  private(set) var emitter: CAEmitterLayer?
  private(set) var emitterCell: CAEmitterCell?

  func set(emitter:CAEmitterLayer, emitterCell:CAEmitterCell){
    self.emitter = emitter
    self.emitterCell = emitterCell
    emitterCellName = emitterCell.name ?? "fire"
    onEmitterCellChanged(newCell: emitterCell)
  }

  func onEmitterCellChanged(newCell:CAEmitterCell){

  }

  var emitterCellName:String = "fire"
  
}

extension ColorCtrlViewController{

}



