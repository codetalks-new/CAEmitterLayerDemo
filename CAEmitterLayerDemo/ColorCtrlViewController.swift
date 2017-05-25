
import UIKit
class ColorCtrlViewController: BaseCtrlViewController{


  override func onEmitterCellChanged(newCell:CAEmitterCell){

    let color =  UIColor(cgColor: newCell.color!) // newCell.color

    var red:CGFloat = 0
    var green:CGFloat = 0
    var blue:CGFloat = 0
    var alpha:CGFloat = 0

    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

    redSlider.value = Float(red)
    redTextField.text = red.description

    greenSlider.value = Float(green)
    greenTextField.text = green.description


    blueSlider.value = Float(blue)
    blueTextField.text = blue.description


    alphaSlider.value = Float(alpha)
    alphaTextField.text = alpha.description

    onBaseColorChanged()


    redRangeSlider.value = newCell.redRange
    onRedRangeChanged(redRangeSlider)


    greenRangeSlider.value = newCell.greenRange
    onGreenRangeChanged(greenRangeSlider)


    blueRangeSlider.value = newCell.blueRange
    onBlueRangeChanged(blueRangeSlider)


    alphaRangeSlider.value = newCell.alphaRange
    onAlphaRangeChanged(alphaRangeSlider)


    redSpeedSlider.value = newCell.redSpeed
    onRedSpeedChanged(redSpeedSlider)


    greenSpeedSlider.value = newCell.greenSpeed
    onGreenSpeedChanged(greenSpeedSlider)


    blueSpeedSlider.value = newCell.blueSpeed
    onBlueSpeedChanged(blueSpeedSlider)


    alphaSpeedSlider.value = newCell.alphaSpeed
    alphaSpeedSlider.minimumValue = -1
    alphaSpeedSlider.maximumValue = 1
    onAlphaSpeedChanged(alphaSpeedSlider)


  }

  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var redTextField: UITextField!

  func onBaseColorChanged(){
    let red = CGFloat(redSlider.value)
    let green = CGFloat(redSlider.value)
    let blue = CGFloat(redSlider.value)
    let alpha = CGFloat(redSlider.value)

    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)

    emitter?.setValue(color.cgColor,forKeyPath:"emitterCells.\(emitterCellName).color")

  }

  @IBAction func onRedChanged(_ sender: Any) {
    let newValue = redSlider.value
    redTextField.text = newValue.description
    onBaseColorChanged()
  }

  @IBAction func onRedEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    redSlider.setValue(newValue, animated: true)
    onBaseColorChanged()

  }



  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var greenTextField: UITextField!

  @IBAction func onGreenChanged(_ sender: Any) {
    let newValue = greenSlider.value
    greenTextField.text = newValue.description
    onBaseColorChanged()
  }

  @IBAction func onGreenEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    greenSlider.setValue(newValue, animated: true)
    onBaseColorChanged()

  }



  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var blueTextField: UITextField!

  @IBAction func onBlueChanged(_ sender: Any) {
    let newValue = blueSlider.value
    blueTextField.text = newValue.description
    onBaseColorChanged()
  }

  @IBAction func onBlueEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    blueSlider.setValue(newValue, animated: true)
    onBaseColorChanged()

  }



  @IBOutlet weak var alphaSlider: UISlider!
  @IBOutlet weak var alphaTextField: UITextField!

  @IBAction func onAlphaChanged(_ sender: Any) {
    let newValue = alphaSlider.value
    alphaTextField.text = newValue.description
    onBaseColorChanged()
  }

  @IBAction func onAlphaEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    alphaSlider.setValue(newValue, animated: true)
    onBaseColorChanged()

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
