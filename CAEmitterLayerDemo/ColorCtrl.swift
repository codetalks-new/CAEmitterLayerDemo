
import UIKit
class ColorCtrlViewController: BaseCtrlViewController{


  override func onEmitterCellChanged(newCell:CAEmitterCell){


    redRangeSlider.value = newCell.redRange
    redRangeTextField.text = newCell.redRange.description


    greenRangeSlider.value = newCell.greenRange
    greenRangeTextField.text = newCell.greenRange.description


    blueRangeSlider.value = newCell.blueRange
    blueRangeTextField.text = newCell.blueRange.description


    alphaRangeSlider.value = newCell.alphaRange
    alphaRangeTextField.text = newCell.alphaRange.description


    redSpeedSlider.value = newCell.redSpeed
    redSpeedTextField.text = newCell.redSpeed.description


    greenSpeedSlider.value = newCell.greenSpeed
    greenSpeedTextField.text = newCell.greenSpeed.description


    blueSpeedSlider.value = newCell.blueSpeed
    blueSpeedTextField.text = newCell.blueSpeed.description


    alphaSpeedSlider.value = newCell.alphaSpeed
    alphaSpeedTextField.text = newCell.alphaSpeed.description


  }

  @IBOutlet weak var redRangeSlider: UISlider!
  @IBOutlet weak var redRangeTextField: UITextField!

  @IBAction func onRedRangeChanged(_ sender: Any) {
    let newValue = redRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redRange")
    redRangeTextField.text = newValue.description
  }

  @IBAction func onRedRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redRange")
    redRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var greenRangeSlider: UISlider!
  @IBOutlet weak var greenRangeTextField: UITextField!

  @IBAction func onGreenRangeChanged(_ sender: Any) {
    let newValue = greenRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenRange")
    greenRangeTextField.text = newValue.description
  }

  @IBAction func onGreenRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenRange")
    greenRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var blueRangeSlider: UISlider!
  @IBOutlet weak var blueRangeTextField: UITextField!

  @IBAction func onBlueRangeChanged(_ sender: Any) {
    let newValue = blueRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueRange")
    blueRangeTextField.text = newValue.description
  }

  @IBAction func onBlueRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueRange")
    blueRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var alphaRangeSlider: UISlider!
  @IBOutlet weak var alphaRangeTextField: UITextField!

  @IBAction func onAlphaRangeChanged(_ sender: Any) {
    let newValue = alphaRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaRange")
    alphaRangeTextField.text = newValue.description
  }

  @IBAction func onAlphaRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaRange")
    alphaRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var redSpeedSlider: UISlider!
  @IBOutlet weak var redSpeedTextField: UITextField!

  @IBAction func onRedSpeedChanged(_ sender: Any) {
    let newValue = redSpeedSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redSpeed")
    redSpeedTextField.text = newValue.description
  }

  @IBAction func onRedSpeedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redSpeed")
    redSpeedSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var greenSpeedSlider: UISlider!
  @IBOutlet weak var greenSpeedTextField: UITextField!

  @IBAction func onGreenSpeedChanged(_ sender: Any) {
    let newValue = greenSpeedSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenSpeed")
    greenSpeedTextField.text = newValue.description
  }

  @IBAction func onGreenSpeedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenSpeed")
    greenSpeedSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var blueSpeedSlider: UISlider!
  @IBOutlet weak var blueSpeedTextField: UITextField!

  @IBAction func onBlueSpeedChanged(_ sender: Any) {
    let newValue = blueSpeedSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueSpeed")
    blueSpeedTextField.text = newValue.description
  }

  @IBAction func onBlueSpeedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueSpeed")
    blueSpeedSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var alphaSpeedSlider: UISlider!
  @IBOutlet weak var alphaSpeedTextField: UITextField!

  @IBAction func onAlphaSpeedChanged(_ sender: Any) {
    let newValue = alphaSpeedSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaSpeed")
    alphaSpeedTextField.text = newValue.description
  }

  @IBAction func onAlphaSpeedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaSpeed")
    alphaSpeedSlider.setValue(newValue, animated: true)

  }




}
