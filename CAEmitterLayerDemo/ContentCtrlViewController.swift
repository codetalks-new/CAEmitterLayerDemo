//
//  ContentCtrlViewController.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 28/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit

class ContentCtrlViewController: BaseCtrlViewController {
  @IBOutlet weak var particleButton: UIButton!

  @IBAction func onChangeParticleButtonPressed(_ sender: UIButton) {
  }

  override func onEmitterCellChanged(newCell: CAEmitterCell) {

    if newCell.contents != nil{
        particleButton.setImage(UIImage(cgImage:newCell.contents as! CGImage), for: .normal)
    }

    let rect = newCell.contentsRect
    xSlider.setValue(Float(rect.origin.x), animated: false)
    ySlider.setValue(Float(rect.origin.y), animated: false)
    widthSlider.setValue(Float(rect.width), animated: false)
    heightSlider.setValue(Float(rect.height), animated: false)

    xTextField.text = rect.origin.x.description
    yTextField.text = rect.origin.x.description
    widthTextField.text = rect.width.description
    heightTextField.text = rect.height.description
    onContentsRectChanged()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  func onContentsRectChanged(){
    let x = CGFloat(xSlider.value)
    let y = CGFloat(ySlider.value)
    let width = CGFloat(widthSlider.value)
    let height = CGFloat(heightSlider.value)
    let newContentsRect = CGRect(x: x, y: y, width: width, height: height)
        emitter?.setValue(newContentsRect,forKeyPath:"emitterCells.\(emitterCellName).contentsRect")


  }
  
  @IBOutlet weak var xSlider: UISlider!

  @IBOutlet weak var xTextField: UITextField!


  @IBAction func onXChanged(_ sender: UISlider) {
    let newValue = xSlider.value
    xTextField.text = newValue.description
    onContentsRectChanged()
  }

  @IBAction func onXEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    xSlider.setValue(newValue, animated: true)
    onContentsRectChanged()

  }




  @IBOutlet weak var ySlider: UISlider!

  @IBOutlet weak var yTextField: UITextField!


  @IBAction func onYChanged(_ sender: UISlider) {
    let newValue = ySlider.value
    yTextField.text = newValue.description
    onContentsRectChanged()
  }

  @IBAction func onYEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    ySlider.setValue(newValue, animated: true)
    onContentsRectChanged()

  }




  @IBOutlet weak var widthSlider: UISlider!

  @IBOutlet weak var widthTextField: UITextField!


  @IBAction func onWidthChanged(_ sender: UISlider) {
    let newValue = widthSlider.value
    widthTextField.text = newValue.description
    onContentsRectChanged()
  }

  @IBAction func onWidthEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    widthSlider.setValue(newValue, animated: true)
    onContentsRectChanged()

  }




  @IBOutlet weak var heightSlider: UISlider!

  @IBOutlet weak var heightTextField: UITextField!


  @IBAction func onHeightChanged(_ sender: UISlider) {
    let newValue = heightSlider.value
    heightTextField.text = newValue.description
    onContentsRectChanged()
  }

  @IBAction func onHeightEditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    heightSlider.setValue(newValue, animated: true)
    onContentsRectChanged()
    
  }
  
}
