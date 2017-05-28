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
  let behaviorCtrl = Main.instantiateBehaviorCtrl()
  let contentCtrl = Main.instantiateContentCtrl()

  var segCtrls:[UIViewController]{
    return [emitterCtrl,scaleCtrl, motionCtrl, colorCtrl, behaviorCtrl,contentCtrl]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    emitter.frame = effectView.bounds
    effectView.layer.addSublayer(emitter)

    // configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive
    emitter.emitterPosition = CGPoint(x:emitter.frame.midX,y:emitter.frame.midY)
    emitter.emitterSize = CGSize(width: 10, height: 10)
    emitter.emitterShape = kCAEmitterLayerRectangle

    // create particle template
    let emitterCell = CAEmitterCell()
    emitterCell.name = "cross"
    emitterCell.contents = #imageLiteral(resourceName: "particle_cross").cgImage
    emitterCell.birthRate = 300
    emitterCell.lifetime = 2.0
    emitterCell.lifetimeRange = 0.8
    emitterCell.scale = 0.20
    emitterCell.color = UIColor(red: 0.6, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
    emitterCell.alphaSpeed = -0.4
    emitterCell.redSpeed = 0.6
    emitterCell.blueSpeed = 0.12
    emitterCell.velocity = 50
    emitterCell.velocityRange = 20
    emitterCell.emissionRange = CGFloat.pi * 2.0

    behaviorCtrl.emitter = emitter
    emitterCtrl.emitter = emitter
    
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
    contentCtrl.set(emitter: emitter, emitterCell: emitterCell)
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
    previousController = controller
  }

  @IBAction func onResetButtonPressed(_ sender: Any) {
    guard let currentVC = previousController else{
      return
    }
    let resetCell = CAEmitterCell()
    resetCell.contents = #imageLiteral(resourceName: "particle_cross").cgImage

    if let vc = currentVC as? ScaleAndFilterCtrlViewController{
      vc.onEmitterCellChanged(newCell: resetCell)
    }else if let vc = currentVC as? MotionAndTemporalCtrlViewController{
      vc.onEmitterCellChanged(newCell: resetCell)
    }else if let vc = currentVC as? ColorCtrlViewController{
      vc.onEmitterCellChanged(newCell: resetCell)
    }else if let vc = currentVC as? ContentCtrlViewController{
      vc.onEmitterCellChanged(newCell: resetCell)
    }
  }

}

