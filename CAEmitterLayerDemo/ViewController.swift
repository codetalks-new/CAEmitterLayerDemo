//
//  ViewController.swift
//  CAEmitterLayerDemo
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var controlContainer: UIView!

  @IBOutlet weak var effectView: UIView!
  let emitter = CAEmitterLayer()
  
  @IBOutlet weak var containerView: UIView!

  var colorCtrl: ColorCtrlViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emitter.frame = effectView.bounds
    effectView.layer.addSublayer(emitter)

    // configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive
    emitter.emitterPosition = CGPoint(x:emitter.frame.midX,y:emitter.frame.midY)

    // create particle template
    let emitterCell = CAEmitterCell()
    emitterCell.name = "fire"
    emitterCell.contents = #imageLiteral(resourceName: "Particle").cgImage
    emitterCell.birthRate = 150
    emitterCell.lifetime = 5.0
    emitterCell.color = UIColor(red: 0.5, green: 0.5, blue: 0.1, alpha: 1.0).cgColor
    emitterCell.alphaSpeed = -0.4
    emitterCell.redRange = 0.2
    emitterCell.velocity = 50
    emitterCell.velocityRange = 50
    emitterCell.emissionRange = CGFloat.pi * 2.0

    // add particle template to emitter
    emitter.emitterCells = [emitterCell]

    findCtrlViewControllers()

    colorCtrl?.set(emitter: emitter, emitterCell: emitterCell)
  }

  func findCtrlViewControllers(){
    for childVc in childViewControllers{
      switch childVc {
      case is ColorCtrlViewController:
        self.colorCtrl = childVc as?ColorCtrlViewController
      default:
        break
      }
    }
  }

}

