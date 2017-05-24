//
//  ViewController.swift
//  CAEmitterLayerDemo
//  Copyright © 2017 BetaGo. All rights reserved.
//


import UIKit

typealias Main  = StoryboardScene.Main

class MainViewController: UIViewController {
  @IBOutlet weak var controlContainer: UIView!

  @IBOutlet weak var effectView: UIView!
  let emitter = CAEmitterLayer()
  
  @IBOutlet weak var segmentBar: UISegmentedControl!
  @IBOutlet weak var containerView: UIView!

  let emitterCtrl = Main.instantiateEmitterLayerCtrl()
  let colorCtrl = Main.instantiateColorCtrl()
  let motionCtrl  = Main.instantiateMotionAndTemporalCtrl()
  let scaleCtrl = Main.instantiateScaleAndFilterCtrl()

  var segCtrls:[UIViewController]{
    return [emitterCtrl,scaleCtrl, motionCtrl, colorCtrl]
  }
  
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

    for childVc in segCtrls{
      // 访问 view 以便其执行加载 View 的初始化过程
      let frame = childVc.view.frame
      NSLog("\(childVc) frame = \(frame)")
    }

    // add particle template to emitter
    emitter.emitterCells = [emitterCell]

    colorCtrl.set(emitter: emitter, emitterCell: emitterCell)
    motionCtrl.set(emitter: emitter, emitterCell: emitterCell)
    scaleCtrl.set(emitter: emitter, emitterCell: emitterCell)
    emitterCtrl.emitter = emitter
    emitterCtrl.onEmitterLayerSetup(layer: emitter)

    segmentBar.selectedSegmentIndex = 0
    switchToController(controller:emitterCtrl)
  }



  @IBAction func onSelectedSegmentChanged(_ sender: UISegmentedControl) {
    let vc = segCtrls[sender.selectedSegmentIndex]
    switchToController(controller: vc)
  }

  var previousController:UIViewController?
  func switchToController(controller:UIViewController){
    previousController?.view.removeFromSuperview()
    previousController?.removeFromParentViewController()
    
    addChildViewController(controller)
    controller.view.frame = containerView.bounds
    containerView.addSubview(controller.view)
    controller.didMove(toParentViewController: self)
  }


}

