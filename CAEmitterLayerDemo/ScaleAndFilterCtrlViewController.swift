
import UIKit

enum CAFilter:Int{
  case linear = 0
  case nearest
  case trilinear

  var filter:String{
    switch self {
    case .linear:
      return kCAFilterLinear
    case .nearest:
      return kCAFilterNearest
    case .trilinear:
      return kCAFilterTrilinear
    }
  }

  static func findBy(filter:String) -> CAFilter?{
    return allCases.first{ $0.filter == filter }
  }

  static let allCases:[CAFilter] = [.linear, .nearest, .trilinear]
}

class ScaleAndFilterCtrlViewController: BaseCtrlViewController{


  override func onEmitterCellChanged(newCell:CAEmitterCell){


    scaleSlider.minimumValue = 0
    scaleSlider.maximumValue = 3
    scaleSlider.value = Float(newCell.scale)
    scaleTextField.text = newCell.scale.description
    


    scaleSpeedSlider.minimumValue = -1
    scaleSpeedSlider.maximumValue = 1
    scaleSpeedSlider.value = Float(newCell.scaleSpeed)
    scaleSpeedTextField.text = newCell.scaleSpeed.description


    scaleRangeSlider.minimumValue = 0
    scaleRangeSlider.maximumValue = 3
    scaleRangeSlider.value = Float(newCell.scaleRange)
    scaleRangeTextField.text = newCell.scaleRange.description

    magnificationFilterSlider.minimumValue = 0
    magnificationFilterSlider.maximumValue = 2.5
    magnificationFilterTextField.isEnabled = false
    if let cafilter = CAFilter.findBy(filter: newCell.magnificationFilter){
      magnificationFilterSlider.value = Float(cafilter.rawValue)
      magnificationFilterTextField.text = newCell.magnificationFilter
    }


    minificationFilterSlider.minimumValue = 0
    minificationFilterSlider.maximumValue = 2.5
    minificationFilterTextField.isEnabled = false

    if let cafilter = CAFilter.findBy(filter: newCell.magnificationFilter){
      minificationFilterSlider.value = Float(cafilter.rawValue)
      magnificationFilterTextField.text = newCell.magnificationFilter
    }


    minificationFilterBiasTextField.isEnabled = false
    minificationFilterBiasSlider.value = Float(newCell.minificationFilterBias)
    minificationFilterBiasTextField.text = newCell.minificationFilterBias.description


  }

  @IBOutlet weak var scaleSlider: UISlider!
  @IBOutlet weak var scaleTextField: UITextField!

  @IBAction func onScaleChanged(_ sender: Any) {
    let newValue = scaleSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scale")
    scaleTextField.text = newValue.description
  }

  @IBAction func onScaleEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scale")
    scaleSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var scaleSpeedSlider: UISlider!
  @IBOutlet weak var scaleSpeedTextField: UITextField!

  @IBAction func onScaleSpeedChanged(_ sender: Any) {
    let newValue = scaleSpeedSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scaleSpeed")
    scaleSpeedTextField.text = newValue.description
  }

  @IBAction func onScaleSpeedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scaleSpeed")
    scaleSpeedSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var scaleRangeSlider: UISlider!
  @IBOutlet weak var scaleRangeTextField: UITextField!

  @IBAction func onScaleRangeChanged(_ sender: Any) {
    let newValue = scaleRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scaleRange")
    scaleRangeTextField.text = newValue.description
  }

  @IBAction func onScaleRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).scaleRange")
    scaleRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var magnificationFilterSlider: UISlider!
  @IBOutlet weak var magnificationFilterTextField: UITextField!

  @IBAction func onMagnificationFilterChanged(_ sender: Any) {
    let newValue = magnificationFilterSlider.value
    if let cafilter = CAFilter(rawValue: Int(newValue)){
      emitter?.setValue(cafilter.filter,forKeyPath:"emitterCells.\(emitterCellName).magnificationFilter")
      magnificationFilterTextField.text = cafilter.filter
    }
  }




  @IBOutlet weak var minificationFilterSlider: UISlider!
  @IBOutlet weak var minificationFilterTextField: UITextField!

  @IBAction func onMinificationFilterChanged(_ sender: Any) {
    let newValue = minificationFilterSlider.value
    if let cafilter = CAFilter(rawValue: Int(newValue)){
      emitter?.setValue(cafilter.filter,forKeyPath:"emitterCells.\(emitterCellName).minificationFilter")
      minificationFilterTextField.text = cafilter.filter
    }
  }




  @IBOutlet weak var minificationFilterBiasSlider: UISlider!
  @IBOutlet weak var minificationFilterBiasTextField: UITextField!

  @IBAction func onMinificationFilterBiasChanged(_ sender: Any) {
    let newValue = minificationFilterBiasSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).minificationFilterBias")
    minificationFilterBiasTextField.text = newValue.description
  }





}
