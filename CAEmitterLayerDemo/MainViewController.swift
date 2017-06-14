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
  var  emitter = CAEmitterLayer()
  
  @IBOutlet weak var segmentBar: UISegmentedControl!
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var presetButton: UIButton!

  let emitterCtrl = Main.instantiateEmitterLayerCtrl()
  let colorCtrl = Main.instantiateColorCtrl()
  let motionCtrl  = Main.instantiateMotionAndTemporalCtrl()
  let scaleCtrl = Main.instantiateScaleAndFilterCtrl()
  let contentCtrl = Main.instantiateContentCtrl()

  var segCtrls:[UIViewController]{
    return [emitterCtrl,scaleCtrl, motionCtrl, colorCtrl,contentCtrl]
  }

  var cellCtrls:[BaseCtrlViewController]{
    return [scaleCtrl, motionCtrl, colorCtrl,  contentCtrl]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for childVc in segCtrls{
      // 访问 view 以便其执行加载 View 的初始化过程
      let frame = childVc.view.frame
      NSLog("\(childVc) frame = \(frame)")
    }

    update(emitter: liveFireworkEmitter)

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

    if let vc = currentVC as? BaseCtrlViewController{
      vc.onEmitterCellChanged(newCell: resetCell)
    }
  }

  @IBAction func onChangePresetButtonPressed(_ sender: Any) {

    pick(from: PresetEffect.allCases, title: "请选择预设效果") { (effect) in
      self.change(effect: effect)
    }
  }

  func change(effect:PresetEffect){
    switch effect{
    case .flake:
      update(emitter: snowflakeEmitter)
    case .firework:
      update(emitter: fireworkEmitter)
    case .fire:
      update(emitter: fireEmitter)
    case .giftbubble:
      update(emitter: giftEmitter)
    case .circleEffect:
      update(emitter: circleEffect)
    case .liveFirework:
      update(emitter: liveFireworkEmitter)
    default:
      break
    }
  }

  func update(emitter:CAEmitterLayer){
      guard let cell = emitter.emitterCells?.first else{
        return
      }
      let oldEmitter = self.emitter
      oldEmitter.removeFromSuperlayer()
      self.emitter  = emitter
      emitter.frame = effectView.bounds
      effectView.layer.addSublayer(emitter)
    for ctrl in cellCtrls{
      ctrl.set(emitter: emitter, emitterCell: cell)
    }
    emitterCtrl.emitter = emitter
    emitterCtrl.onEmitterLayerSetup(layer: emitter)


  }

  lazy var defaultEmitter:CAEmitterLayer = {
    let emitter = CAEmitterLayer()
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

    // add particle template to emitter
    emitter.emitterCells = [emitterCell]
    return emitter
  }()
  
// part of the below code taken from http://www.jianshu.com/p/6f5d7cfdae2f

  lazy var snowflakeEmitter:CAEmitterLayer = {
      let emitter  = CAEmitterLayer()
    emitter.emitterPosition = CGPoint(x: 100, y: 30)
    emitter.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    emitter.emitterMode = kCAEmitterLayerOutline
    emitter.emitterShape =  kCAEmitterLayerLine

    emitter.shadowOpacity = 1.0
    emitter.shadowRadius = 0.0
    emitter.shadowOffset = CGSize(width: 0, height: 1.0)
    emitter.shadowColor = UIColor.white.cgColor

    let flake = CAEmitterCell()
    flake.contents = #imageLiteral(resourceName: "particle_flake").cgImage
    flake.name = "flake"
    flake.birthRate = 8
    flake.lifetime = 10
    flake.scale  = 0.614
    flake.lifetimeRange = 4
    flake.velocity = -1
    flake.velocityRange  = 10
    flake.xAcceleration = 16
    flake.yAcceleration = 35
    flake.emissionRange = 0.5 * CGFloat.pi
    flake.spinRange = 0.25 * CGFloat.pi
    flake.color = UIColor.red.cgColor

    emitter.emitterCells = [flake]

    return emitter
  }()

  lazy var fireworkEmitter:CAEmitterLayer = {
      let emitter = CAEmitterLayer()
      let bounds = self.effectView.bounds
      emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.maxY)
      emitter.emitterSize = CGSize(width: bounds.width * 0.5, height: 0)
      emitter.emitterMode = kCAEmitterLayerOutline
      emitter.emitterShape =  kCAEmitterLayerLine
      emitter.renderMode = kCAEmitterLayerAdditive

    let rocket = CAEmitterCell()
     rocket.birthRate = 1.0
     rocket.emissionRange = 0.25 * CGFloat.pi
     rocket.velocity = 380
    rocket.velocityRange = 100
    rocket.yAcceleration = 75
    rocket.lifetime = 1.02
    rocket.contents = #imageLiteral(resourceName: "particle_ring").cgImage
    rocket.scale = 0.2
    rocket.contents = UIColor.red.cgColor
    rocket.greenRange = 1.0
    rocket.redRange = 1.0
    rocket.blueRange = 1.0
    rocket.spinRange = CGFloat.pi

    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    let burst = CAEmitterCell()
    burst.birthRate = 1.0
    burst.velocityRange = 0
    burst.scale = 2.5
    burst.redSpeed = -1.5
    burst.blueSpeed = 1.5
    burst.greenSpeed = 1.0
    burst.lifetime = 0.35

    let spark = CAEmitterCell()
    spark.birthRate = 400
    spark.velocity = 125
    spark.emissionRange = 2 * CGFloat.pi
    spark.yAcceleration = 75
    spark.lifetime = 3

    spark.contents = #imageLiteral(resourceName: "particle_star_outline").cgImage
    spark.scaleSpeed = -0.2
    spark.greenSpeed = -0.1
    spark.redSpeed = 0.4
    spark.blueSpeed = -0.1
    spark.alphaSpeed = -0.25
    spark.spin = 2 * CGFloat.pi
    spark.spinRange = 2 * CGFloat.pi

    emitter.emitterCells = [rocket]
    rocket.emitterCells = [burst]
    burst.emitterCells = [spark]


    return emitter
  }()

  lazy var fireEmitter :CAEmitterLayer = {
    // 代码参考自:
    // https://my.oschina.net/u/2340880/blog/485095
      let emitter = CAEmitterLayer()
    let bounds = self.effectView.bounds
    emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.maxY)
    emitter.emitterSize = CGSize(width: bounds.width - 100, height: 20)
    emitter.renderMode = kCAEmitterLayerAdditive

    //
    let fire = CAEmitterCell()
    fire.contents = #imageLiteral(resourceName: "particle_fire").cgImage
    fire.name = "fire"
    fire.birthRate = 300
    fire.lifetime = 2.5
    fire.lifetimeRange = 1.5
    fire.color = UIColor(red: 0.22, green: 0.4, blue: 0.0, alpha: 0.6).cgColor
    fire.redSpeed = 1.0
    fire.greenSpeed = 0.13
    fire.velocity = 160
    fire.velocityRange = 80
    fire.emissionLongitude = CGFloat.pi + CGFloat.pi / 2
    fire.emissionRange = CGFloat.pi / 2
    fire.scaleSpeed = 0.3
    fire.spin = 0.1


    //
    let smoke = CAEmitterCell()
    smoke.contents = #imageLiteral(resourceName: "particle_smoke").cgImage
    smoke.birthRate = 100
    smoke.lifetime = 3.0
    smoke.lifetimeRange = 1.5
    smoke.color = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
    smoke.name = "smoke"
    smoke.velocity = 250
    smoke.velocityRange = 100
    smoke.emissionLongitude = CGFloat.pi + CGFloat.pi / 2
    smoke.emissionRange = CGFloat.pi / 2

    emitter.emitterCells = [fire,smoke]
    
    
    
      return emitter
  }()

  lazy var giftEmitter:CAEmitterLayer = {
      let emitter = CAEmitterLayer()
    let bounds = self.effectView.bounds
    emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.maxY)
    emitter.emitterSize = CGSize(width: 4, height: 20)
    emitter.renderMode = kCAEmitterLayerAdditive
    emitter.emitterShape = kCAEmitterLayerLine


    let heart = CAEmitterCell()
    heart.contents = #imageLiteral(resourceName: "particle_heart").cgImage
    heart.name = "heart"
    heart.birthRate = 1.5
    heart.lifetime = 7
    heart.lifetimeRange = 3.6
    heart.velocity = -20
    heart.velocityRange = 10
    heart.yAcceleration = -76
    heart.alphaRange = 0.2
    heart.blueRange = 0.4
    heart.redRange = 1.0
    heart.greenRange = 1.0
    heart.color = UIColor(red: 0.76, green: 0.70, blue: 0.5, alpha: 1.0).cgColor
    heart.emissionLatitude = CGFloat.pi * 0.4
    heart.emissionLongitude = CGFloat.pi * 0.8
    heart.emissionRange = CGFloat.pi * 1.3
    heart.redSpeed = 0.65
    heart.greenSpeed = 0.62
    heart.blueSpeed = 0.036
    

    emitter.emitterCells = [heart]
    
    
    return emitter
  }()

  lazy var   circleEffect : CAEmitterLayer = {
    let emitter = CAEmitterLayer()
    let bounds = self.effectView.bounds
    let innerBounds =  bounds
    emitter.frame = bounds
    emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
    emitter.emitterSize = CGSize(width: innerBounds.width * 0.5, height: innerBounds.height * 0.5)
    emitter.renderMode = kCAEmitterLayerAdditive
    emitter.emitterMode = kCAEmitterLayerOutline
    emitter.emitterShape = kCAEmitterLayerCircle

    //
    let fire = CAEmitterCell()
    fire.contents = #imageLiteral(resourceName: "particle_fire").cgImage
    fire.name = "fire"

    // 1) 缩放
    fire.scale = 0.25
    fire.scaleRange = 0.02
    fire.scaleSpeed = -0.01

    // 2) range
    fire.emissionRange = CGFloat.pi * 2

    // 3) Temporal
    fire.birthRate = 240
    fire.lifetime = 3.2
    fire.lifetimeRange = 2.0

    // 4) move
    fire.velocity = -2.8
    fire.velocityRange = 5

    // 5) color
    fire.color = UIColor(red: 0.51, green: 0.25, blue: 0.28, alpha: 1.0).cgColor
    fire.redRange = 0.73
    fire.greenRange = 0.4
    fire.blueRange = 0.4
    fire.alphaRange = 0.2

    fire.redSpeed = 0.36
    fire.greenSpeed = 0.16


    emitter.emitterCells = [fire]
    return emitter
  }()

  lazy var liveFireworkEmitter: CAEmitterLayer = {
    let bounds = self.effectView.bounds
    let mortor = CAEmitterLayer()
    mortor.emitterPosition = CGPoint(x:bounds.midX, y:bounds.midY)
    mortor.renderMode = kCAEmitterLayerAdditive

    //Invisible particle representing the rocket before the explosion
    let rocket = CAEmitterCell()
    rocket.emissionLongitude = CGFloat.pi / 2
    rocket.emissionLatitude = 0
    rocket.lifetime = 1.6
    rocket.birthRate = 2
    rocket.velocity = -400
    rocket.velocityRange = 100
    rocket.yAcceleration = -250
    rocket.emissionRange = CGFloat.pi / 4
    rocket.color = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
    rocket.redRange = 0.9
    rocket.greenRange = 0.5
    rocket.blueRange = 0.0

    //Name the cell so that it can be animated later using keypath
    rocket.name = "rocket"


    let img = #imageLiteral(resourceName: "particle_tspark").cgImage
    //Flare particles emitted from the rocket as it flys
    let flare = CAEmitterCell()
    flare.contents = img
    flare.emissionLongitude = (4 * CGFloat.pi) / 2
    flare.scale = 0.4
    flare.velocity = -100
    flare.birthRate = 45
    flare.lifetime = 1.5
    flare.yAcceleration = -350
    flare.emissionRange = CGFloat.pi / 7
    flare.alphaSpeed = -0.7
    flare.scaleSpeed = -0.1
    flare.scaleRange = 0.1
    flare.beginTime = 0.01
    flare.duration = 0.7

    //The particles that make up the explosion
    let firework = CAEmitterCell()
    firework.contents = img
    firework.birthRate = 6666
    firework.scale = 0.6
    firework.velocity = 130
    firework.lifetime = 2
    firework.alphaSpeed = -0.2
    firework.yAcceleration = 80
    firework.beginTime = 1.5
    firework.duration = 0.1
    firework.emissionRange = 2 * CGFloat.pi
    firework.scaleSpeed = -0.1
    firework.spin = 1

    //Name the cell so that it can be animated later using keypath
    firework.name = "firework"

    //preSpark is an invisible particle used to later emit the spark
    let preSpark = CAEmitterCell()
    preSpark.birthRate = 80
    preSpark.velocity = firework.velocity * 0.70
    preSpark.lifetime = 1.7
    preSpark.yAcceleration = firework.yAcceleration * 0.85
    preSpark.beginTime = firework.beginTime - 0.2
    preSpark.emissionRange = firework.emissionRange
    preSpark.greenSpeed = 100
    preSpark.blueSpeed = 100
    preSpark.redSpeed = 100

    //Name the cell so that it can be animated later using keypath
    preSpark.name = "preSpark"

    //The 'sparkle' at the end of a firework
    let spark = CAEmitterCell()
    spark.contents = img
    spark.lifetime = 0.05
    spark.yAcceleration = 250
    spark.beginTime = 0.8
    spark.scale = 0.4
    spark.birthRate = 10
    
    preSpark.emitterCells = [spark]
    rocket.emitterCells = [flare, firework, preSpark]
    mortor.emitterCells = [rocket]
    return mortor
  }()
}


//PresetEffect
//fire
//flake
//smoke
//firework
enum PresetEffect  {
            case fire
            case flake
            case smoke
            case firework
            case giftbubble
            case circleEffect
            case liveFirework
    var isFire:Bool{ return self == .fire }
    var isFlake:Bool{ return self == .flake }
    var isSmoke:Bool{ return self == .smoke }
    var isFirework:Bool{ return self == .firework }

    var title:String{
        switch self{
        case .fire:return "火花"
        case .flake:return "雪花"
        case .smoke:return "烟"
        case .firework:return "一个烟花"
        case .giftbubble: return "礼物泡泡"
        case .circleEffect: return "花环"
        case .liveFirework: return "放烟花"
        }
    }

    static let allCases:[PresetEffect] = [.fire, .flake, .firework, .giftbubble, .circleEffect, .liveFirework]
}



extension PresetEffect:PickerItem{}
