//
//  SimplePickerViewController.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 24/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit



class SimplePickerViewController<T:PickerItem>:BasePickerViewController{
  let picker = UIPickerView(frame: .zero)
  let adapter = SimplePickerAdapter<T>(items: [])

  typealias OnSelectItem = ((T) -> Void)
  var onSelectItem:OnSelectItem?

  init(items:[T]){
    super.init(nibName: nil, bundle: nil)
    adapter.update(items: items)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override var pickerView: UIView{
    return picker
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    adapter.bind(to: picker)
  }

  func bind(items:[T]){
    adapter.update(items: items)
  }

  override func onDoneButtonPressed() {
    let selectedRow = picker.selectedRow(inComponent: 0)
    let item = adapter.items[selectedRow]
    super.onDoneButtonPressed()
    onSelectItem?(item)
  }
}

extension UIViewController{

  func pick<T:PickerItem>(from items:[T],title:String? = nil,onSelect:@escaping ((T) -> Void) ){
    let vc = SimplePickerViewController(items: items)
    vc.titleLabel.text = title
    vc.onSelectItem = onSelect
    present(vc, animated: true, completion: nil)
  }
}
