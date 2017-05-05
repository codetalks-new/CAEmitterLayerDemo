
    import UIKit
    extension ColorCtrlViewController{
                 
@IBOutlet weak var redSpeedSlider: UISlider!
@IBOutlet weak var redSpeedTextField: UITextField!

    @IBAction func onRedSpeedChanged(_ sender: Any) {
        let newValue = redSpeedSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redSpeed")
        redSpeedTextField.text = newValue.description
    }

        

}
@IBOutlet weak var greenSpeedSlider: UISlider!
@IBOutlet weak var greenSpeedTextField: UITextField!

    @IBAction func onGreenSpeedChanged(_ sender: Any) {
        let newValue = greenSpeedSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenSpeed")
        greenSpeedTextField.text = newValue.description
    }

        

}
@IBOutlet weak var blueSpeedSlider: UISlider!
@IBOutlet weak var blueSpeedTextField: UITextField!

    @IBAction func onBlueSpeedChanged(_ sender: Any) {
        let newValue = blueSpeedSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueSpeed")
        blueSpeedTextField.text = newValue.description
    }

        

}
@IBOutlet weak var alphaSpeedSlider: UISlider!
@IBOutlet weak var alphaSpeedTextField: UITextField!

    @IBAction func onAlphaSpeedChanged(_ sender: Any) {
        let newValue = alphaSpeedSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaSpeed")
        alphaSpeedTextField.text = newValue.description
    }

        

}
@IBOutlet weak var redRangeSlider: UISlider!
@IBOutlet weak var redRangeTextField: UITextField!

    @IBAction func onRedRangeChanged(_ sender: Any) {
        let newValue = redRangeSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).redRange")
        redRangeTextField.text = newValue.description
    }

        

}
@IBOutlet weak var greenRangeSlider: UISlider!
@IBOutlet weak var greenRangeTextField: UITextField!

    @IBAction func onGreenRangeChanged(_ sender: Any) {
        let newValue = greenRangeSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).greenRange")
        greenRangeTextField.text = newValue.description
    }

        

}
@IBOutlet weak var blueRangeSlider: UISlider!
@IBOutlet weak var blueRangeTextField: UITextField!

    @IBAction func onBlueRangeChanged(_ sender: Any) {
        let newValue = blueRangeSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).blueRange")
        blueRangeTextField.text = newValue.description
    }

        

}
@IBOutlet weak var alphaRangeSlider: UISlider!
@IBOutlet weak var alphaRangeTextField: UITextField!

    @IBAction func onAlphaRangeChanged(_ sender: Any) {
        let newValue = alphaRangeSlider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).alphaRange")
        alphaRangeTextField.text = newValue.description
    }

        

}