
import UIKit
class MotionAndTemporalCtrlViewController: BaseCtrlViewController{


  override func onEmitterCellChanged(newCell:CAEmitterCell){


    spinSlider.minimumValue = 0
    spinSlider.maximumValue = 1000
    spinSlider.value = Float(newCell.spin)
    spinTextField.text = newCell.spin.description


    spinRangeSlider.minimumValue = 1
    spinRangeSlider.maximumValue = 1000
    spinRangeSlider.value = Float(newCell.spinRange)
    spinRangeTextField.text = newCell.spinRange.description


    emissionLatitudeSlider.value = Float(newCell.emissionLatitude)
    emissionLatitudeTextField.text = newCell.emissionLatitude.description


    emissionLongitudeSlider.value = Float(newCell.emissionLongitude)
    emissionLongitudeTextField.text = newCell.emissionLongitude.description


    emissionRangeSlider.minimumValue = 0
    emissionRangeSlider.maximumValue = Float.pi * 2
    emissionRangeSlider.value = Float(newCell.emissionRange)
    emissionRangeTextField.text = newCell.emissionRange.description

    lifetimeSlider.minimumValue = 1
    lifetimeSlider.maximumValue = 10
    lifetimeSlider.value = Float(newCell.lifetime)
    lifetimeTextField.text = newCell.lifetime.description


    lifetimeRangeSlider.minimumValue = 0
    lifetimeRangeSlider.maximumValue = 10
    lifetimeRangeSlider.value = Float(newCell.lifetimeRange)
    lifetimeRangeTextField.text = newCell.lifetimeRange.description


    birthRateSlider.minimumValue = 0
    birthRateSlider.maximumValue = 1000
    birthRateSlider.value = Float(newCell.birthRate)
    birthRateTextField.text = newCell.birthRate.description


    velocitySlider.minimumValue = 0
    velocitySlider.maximumValue = 1000
    velocitySlider.value = Float(newCell.velocity)
    velocityTextField.text = newCell.velocity.description


    velocityRangeSlider.minimumValue = 0
    velocityRangeSlider.maximumValue = 1000
    velocityRangeSlider.value = Float(newCell.velocityRange)
    velocityRangeTextField.text = newCell.velocityRange.description

    
    xAccelerationSlider.minimumValue = -500
    xAccelerationSlider.maximumValue = 500
    xAccelerationSlider.value = Float(newCell.xAcceleration)
    xAccelerationTextField.text = newCell.xAcceleration.description

    yAccelerationSlider.minimumValue = -500
    yAccelerationSlider.maximumValue = 500
    yAccelerationSlider.value = Float(newCell.yAcceleration)
    yAccelerationTextField.text = newCell.yAcceleration.description


    zAccelerationSlider.minimumValue = -500
    zAccelerationSlider.maximumValue = 500
    zAccelerationSlider.value = Float(newCell.zAcceleration)
    zAccelerationTextField.text = newCell.zAcceleration.description


  }

  @IBOutlet weak var spinSlider: UISlider!
  @IBOutlet weak var spinTextField: UITextField!

  @IBAction func onSpinChanged(_ sender: Any) {
    let newValue = spinSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).spin")
    spinTextField.text = newValue.description
  }

  @IBAction func onSpinEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).spin")
    spinSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var spinRangeSlider: UISlider!
  @IBOutlet weak var spinRangeTextField: UITextField!

  @IBAction func onSpinRangeChanged(_ sender: Any) {
    let newValue = spinRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).spinRange")
    spinRangeTextField.text = newValue.description
  }

  @IBAction func onSpinRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).spinRange")
    spinRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var emissionLatitudeSlider: UISlider!
  @IBOutlet weak var emissionLatitudeTextField: UITextField!

  @IBAction func onEmissionLatitudeChanged(_ sender: Any) {
    let newValue = emissionLatitudeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionLatitude")
    emissionLatitudeTextField.text = newValue.description
  }

  @IBAction func onEmissionLatitudeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionLatitude")
    emissionLatitudeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var emissionLongitudeSlider: UISlider!
  @IBOutlet weak var emissionLongitudeTextField: UITextField!

  @IBAction func onEmissionLongitudeChanged(_ sender: Any) {
    let newValue = emissionLongitudeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionLongitude")
    emissionLongitudeTextField.text = newValue.description
  }

  @IBAction func onEmissionLongitudeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionLongitude")
    emissionLongitudeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var emissionRangeSlider: UISlider!
  @IBOutlet weak var emissionRangeTextField: UITextField!

  @IBAction func onEmissionRangeChanged(_ sender: Any) {
    let newValue = emissionRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionRange")
    emissionRangeTextField.text = newValue.description
  }

  @IBAction func onEmissionRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).emissionRange")
    emissionRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var lifetimeSlider: UISlider!
  @IBOutlet weak var lifetimeTextField: UITextField!

  @IBAction func onLifetimeChanged(_ sender: Any) {
    let newValue = lifetimeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).lifetime")
    lifetimeTextField.text = newValue.description
  }

  @IBAction func onLifetimeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).lifetime")
    lifetimeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var lifetimeRangeSlider: UISlider!
  @IBOutlet weak var lifetimeRangeTextField: UITextField!

  @IBAction func onLifetimeRangeChanged(_ sender: Any) {
    let newValue = lifetimeRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).lifetimeRange")
    lifetimeRangeTextField.text = newValue.description
  }

  @IBAction func onLifetimeRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).lifetimeRange")
    lifetimeRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var birthRateSlider: UISlider!
  @IBOutlet weak var birthRateTextField: UITextField!

  @IBAction func onBirthRateChanged(_ sender: Any) {
    let newValue = birthRateSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).birthRate")
    birthRateTextField.text = newValue.description
  }

  @IBAction func onBirthRateEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).birthRate")
    birthRateSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var velocitySlider: UISlider!
  @IBOutlet weak var velocityTextField: UITextField!

  @IBAction func onVelocityChanged(_ sender: Any) {
    let newValue = velocitySlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).velocity")
    velocityTextField.text = newValue.description
  }

  @IBAction func onVelocityEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).velocity")
    velocitySlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var velocityRangeSlider: UISlider!
  @IBOutlet weak var velocityRangeTextField: UITextField!

  @IBAction func onVelocityRangeChanged(_ sender: Any) {
    let newValue = velocityRangeSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).velocityRange")
    velocityRangeTextField.text = newValue.description
  }

  @IBAction func onVelocityRangeEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).velocityRange")
    velocityRangeSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var xAccelerationSlider: UISlider!
  @IBOutlet weak var xAccelerationTextField: UITextField!

  @IBAction func onXAccelerationChanged(_ sender: Any) {
    let newValue = xAccelerationSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).xAcceleration")
    xAccelerationTextField.text = newValue.description
  }

  @IBAction func onXAccelerationEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).xAcceleration")
    xAccelerationSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var yAccelerationSlider: UISlider!
  @IBOutlet weak var yAccelerationTextField: UITextField!

  @IBAction func onYAccelerationChanged(_ sender: Any) {
    let newValue = yAccelerationSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).yAcceleration")
    yAccelerationTextField.text = newValue.description
  }

  @IBAction func onYAccelerationEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).yAcceleration")
    yAccelerationSlider.setValue(newValue, animated: true)

  }



  @IBOutlet weak var zAccelerationSlider: UISlider!
  @IBOutlet weak var zAccelerationTextField: UITextField!

  @IBAction func onZAccelerationChanged(_ sender: Any) {
    let newValue = zAccelerationSlider.value
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).zAcceleration")
    zAccelerationTextField.text = newValue.description
  }

  @IBAction func onZAccelerationEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).zAcceleration")
    zAccelerationSlider.setValue(newValue, animated: true)

  }




}
