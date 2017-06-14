
import UIKit
class MotionAndTemporalCtrlViewController: BaseCtrlViewController{


  override func onEmitterCellChanged(newCell:CAEmitterCell){


    spinSlider.minimumValue = 0
    spinSlider.maximumValue = 1
    spinSlider.value = Float(newCell.spin)
    onSpinChanged(spinSlider)


    spinRangeSlider.minimumValue = 0
    spinRangeSlider.maximumValue = 1
    spinRangeSlider.value = Float(newCell.spinRange)
    onSpinRangeChanged(spinRangeSlider)


    emissionLatitudeSlider.minimumValue = -6.3
    emissionLatitudeSlider.maximumValue = 6.3
    emissionLatitudeSlider.value = Float(newCell.emissionLatitude)
    onEmissionLatitudeChanged(emissionLatitudeSlider)


    emissionLongitudeSlider.minimumValue = -6.3
    emissionLongitudeSlider.maximumValue = 6.3
    emissionLongitudeSlider.value = Float(newCell.emissionLongitude)
    onEmissionLongitudeChanged(emissionLongitudeSlider)


    emissionRangeSlider.minimumValue = 0
    emissionRangeSlider.maximumValue = Float.pi * 2
    emissionRangeSlider.value = Float(newCell.emissionRange)
    onEmissionRangeChanged(emissionRangeSlider)

    lifetimeSlider.minimumValue = 1
    lifetimeSlider.maximumValue = 10
    lifetimeSlider.value = Float(newCell.lifetime)
    onLifetimeChanged(lifetimeSlider)


    lifetimeRangeSlider.minimumValue = 0
    lifetimeRangeSlider.maximumValue = 10
    lifetimeRangeSlider.value = Float(newCell.lifetimeRange)
    onLifetimeRangeChanged(lifetimeRangeSlider)


    birthRateSlider.minimumValue = 0
    birthRateSlider.maximumValue = 600
    birthRateSlider.value = Float(newCell.birthRate)
    onBirthRateChanged(birthRateSlider)


    velocitySlider.minimumValue = -200
    velocitySlider.maximumValue = 200
    velocitySlider.value = Float(newCell.velocity)
    onVelocityChanged(velocitySlider)


    velocityRangeSlider.minimumValue = -100
    velocityRangeSlider.maximumValue = 100
    velocityRangeSlider.value = Float(newCell.velocityRange)
    onVelocityRangeChanged(velocityRangeSlider)

    
    xAccelerationSlider.minimumValue = -100
    xAccelerationSlider.maximumValue = 100
    xAccelerationSlider.value = Float(newCell.xAcceleration)
    onXAccelerationChanged(xAccelerationSlider)

    yAccelerationSlider.minimumValue = -100
    yAccelerationSlider.maximumValue = 100
    yAccelerationSlider.value = Float(newCell.yAcceleration)
    onYAccelerationChanged(yAccelerationSlider)


    zAccelerationSlider.minimumValue = -100
    zAccelerationSlider.maximumValue = 100
    zAccelerationSlider.value = Float(newCell.zAcceleration)
    onZAccelerationChanged(zAccelerationSlider)


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
