
import UIKit
class EmitterLayerViewController: UIViewController{

  var emitter:CAEmitterLayer?

  func onEmitterLayerSetup(layer:CAEmitterLayer){

    let pos = layer.emitterPosition

    xSlider.minimumValue = -100
    xSlider.maximumValue = 500
    xSlider.value = Float(pos.x)

    xTextField.text = pos.x.description


    ySlider.minimumValue =  -100
    ySlider.maximumValue = 1000
    ySlider.value = Float(pos.y)
    yTextField.text = pos.y.description


    zSlider.minimumValue = 0
    zSlider.maximumValue = 10
    zSlider.value = Float(layer.emitterZPosition)
    zTextField.text = layer.emitterZPosition.description


    let size = layer.emitterSize
    widthSlider.minimumValue = 1
    widthSlider.maximumValue = 300
    widthSlider.value = Float(size.width)
    widthTextField.text = size.width.description


    heightSlider.minimumValue = 1
    heightSlider.maximumValue = 300
    heightSlider.value = Float(size.height)
    heightTextField.text = size.height.description


    depthSlider.minimumValue = 0
    depthSlider.maximumValue = 2
    depthSlider.value = Float(layer.emitterDepth)
    depthTextField.text = layer.emitterDepth.description


    emitterModeButton.setTitle(layer.emitterMode, for: .normal)
    emitterShapeButton.setTitle(layer.emitterShape, for: .normal)
    renderModeButton.setTitle(layer.renderMode, for: .normal)
  }

  @IBOutlet weak var xSlider: UISlider!
  @IBOutlet weak var xTextField: UITextField!

  @IBAction func onXChanged(_ sender: Any) {
    let newValue = xSlider.value
    let pos = CGPoint(x: CGFloat(newValue), y: emitter!.emitterPosition.y)
    emitter?.setValue(pos,forKeyPath:"emitterPosition")
    xTextField.text = newValue.description
  }

  @IBAction func onXEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    xSlider.setValue(newValue, animated: true)
    onXChanged(xSlider)

  }



  @IBOutlet weak var ySlider: UISlider!
  @IBOutlet weak var yTextField: UITextField!

  @IBAction func onYChanged(_ sender: Any) {
    let newValue = ySlider.value
    let pos = CGPoint(x: emitter!.emitterPosition.x  , y: CGFloat(newValue))
    emitter?.setValue(pos,forKeyPath:"emitterPosition")
    yTextField.text = newValue.description
  }

  @IBAction func onYEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    ySlider.setValue(newValue, animated: true)
    onYChanged(ySlider)

  }



  @IBOutlet weak var zSlider: UISlider!
  @IBOutlet weak var zTextField: UITextField!

  @IBAction func onZChanged(_ sender: Any) {
    let newValue = zSlider.value
    emitter?.setValue(CGFloat(newValue),forKeyPath:"emitterZPosition")
    zTextField.text = newValue.description
  }

  @IBAction func onZEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    zSlider.setValue(newValue, animated: true)
    onZChanged(zSlider)

  }



  @IBOutlet weak var widthSlider: UISlider!
  @IBOutlet weak var widthTextField: UITextField!

  @IBAction func onWidthChanged(_ sender: Any) {
    let newValue = widthSlider.value
    let size = CGSize(width: CGFloat(newValue), height: emitter!.emitterSize.height)
    emitter?.setValue(size,forKeyPath:"emitterSize")
    widthTextField.text = newValue.description
  }

  @IBAction func onWidthEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    widthSlider.setValue(newValue, animated: true)
    onWidthChanged(widthSlider)

  }



  @IBOutlet weak var heightSlider: UISlider!
  @IBOutlet weak var heightTextField: UITextField!

  @IBAction func onHeightChanged(_ sender: Any) {
    let newValue = heightSlider.value
    let size = CGSize(width:emitter!.emitterSize.width, height:CGFloat(newValue) )
    emitter?.setValue(size,forKeyPath:"emitterSize")
    heightTextField.text = newValue.description
  }

  @IBAction func onHeightEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    heightSlider.setValue(newValue, animated: true)
    onHeightChanged(heightSlider)

  }



  @IBOutlet weak var depthSlider: UISlider!
  @IBOutlet weak var depthTextField: UITextField!

  @IBAction func onDepthChanged(_ sender: Any) {
    let newValue = depthSlider.value
    emitter?.setValue(CGFloat(newValue),forKeyPath:"emitterDepth")
    depthTextField.text = newValue.description
  }

  @IBAction func onDepthEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    depthSlider.setValue(newValue, animated: true)
    onDepthChanged(depthSlider)

  }

  @IBOutlet weak var emitterShapeButton: UIButton!
  @IBOutlet weak var renderModeButton: UIButton!
  @IBOutlet weak var emitterModeButton: UIButton!

  @IBAction func chooseEmitterShape() {
    pick(from: EmitterShape.allCases,title:"Emitter Shape") { (shape) in
      self.emitter?.setValue(shape.shape, forKeyPath: "emitterShape")
      self.emitterShapeButton.setTitle(shape.title, for: .normal)
    }
  }

  @IBAction func chooseRenderMode() {
    pick(from: RenderMode.allCases, title: "Render Mode") { (item) in
      self.emitter?.renderMode = item.mode
      self.emitter?.setValue(item.mode, forKeyPath: "renderMode")
      self.renderModeButton.setTitle(item.title, for: .normal)
    }
  }

  @IBAction func chooseEmitterMode() {
    pick(from: EmitterMode.allCases, title: "Emitter Mode") { (item) in
      self.emitter?.setValue(item.mode, forKeyPath: "emitterMode")
      self.emitterModeButton.setTitle(item.title, for: .normal)
    }
  }

}

//emitterMode:s
//points
//outline
//surface
//volume
enum EmitterMode :String {
  case points =  "points"
  case outline =  "outline"
  case surface =  "surface"
  case volume =  "volume"
  var isPoints:Bool{ return self == .points }
  var isOutline:Bool{ return self == .outline }
  var isSurface:Bool{ return self == .surface }
  var isVolume:Bool{ return self == .volume }

  var title:String{
    return rawValue
  }

  var mode:String{
    switch self{
    case .points:return kCAEmitterLayerPoints
    case .outline:return kCAEmitterLayerOutline
    case .surface:return kCAEmitterLayerSurface
    case .volume:return kCAEmitterLayerVolume
    }
  }

  static let allCases:[EmitterMode] = [.points, .outline, .surface, .volume ]
}


//EmitterShape:s
//point
//line
//rectangle
//cuboid
//circle
//sphere
enum EmitterShape :String {
  case point =  "point"
  case line =  "line"
  case rectangle =  "rectangle"
  case cuboid =  "cuboid"
  case circle =  "circle"
  case sphere =  "sphere"
  var isPoint:Bool{ return self == .point }
  var isLine:Bool{ return self == .line }
  var isRectangle:Bool{ return self == .rectangle }
  var isCuboid:Bool{ return self == .cuboid }
  var isCircle:Bool{ return self == .circle }
  var isSphere:Bool{ return self == .sphere }

  var title:String{
    return rawValue
  }

  var shape:String{
    switch self{
    case .point:return kCAEmitterLayerPoint
    case .line:return kCAEmitterLayerLine
    case .rectangle:return kCAEmitterLayerRectangle
    case .cuboid:return kCAEmitterLayerCuboid
    case .circle:return kCAEmitterLayerCircle
    case .sphere:return kCAEmitterLayerSphere
    }
  }


  static let allCases:[EmitterShape] = [.point, .line, .rectangle, .cuboid, .circle, .sphere ]
}

//RenderMode:s
//unordered
//additive
//backToFront
//oldestLast
//oldestFirst
enum RenderMode :String {
  case unordered =  "unordered"
  case additive =  "additive"
  case backToFront =  "backToFront"
  case oldestLast =  "oldestLast"
  case oldestFirst =  "oldestFirst"
  var isUnordered:Bool{ return self == .unordered }
  var isAdditive:Bool{ return self == .additive }
  var isBackToFront:Bool{ return self == .backToFront }
  var isOldestLast:Bool{ return self == .oldestLast }
  var isOldestFirst:Bool{ return self == .oldestFirst }

  var title:String{
    return rawValue
  }

  var mode:String{
    switch self{
    case .unordered:return kCAEmitterLayerUnordered
    case .additive:return kCAEmitterLayerAdditive
    case .backToFront:return kCAEmitterLayerBackToFront
    case .oldestLast:return kCAEmitterLayerOldestLast
    case .oldestFirst:return kCAEmitterLayerOldestFirst
    }
  }

  static let allCases:[RenderMode] = [.unordered, .additive, .backToFront, .oldestLast, .oldestFirst ]
}






extension EmitterShape:PickerItem{ }
extension EmitterMode:PickerItem{ }
extension RenderMode:PickerItem{ }



