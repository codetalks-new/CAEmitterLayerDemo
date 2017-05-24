//
//  SimplePickerAdapter.swift
//  BXAppKit
//
//  Created by Haizhen Lee on 11/05/2017.
//  Copyright © 2017 banxi1988. All rights reserved.
//

import UIKit

public protocol PickerItem{
  var title:String { get }
}

/// 单列的 UIPickerView Adapter
public class SimplePickerAdapter<T:PickerItem>:NSObject,UIPickerViewDataSource, UIPickerViewDelegate{
  public private(set) var items:[T] = []
  public var rowHeight:CGFloat = 36
  public var font:UIFont = UIFont.systemFont(ofSize: 13)
  public var textColor:UIColor = UIColor.darkText
  public var didSelectItem: ((T) -> Void)?
  

  public init(items:[T]){
    self.items = items
  }

  weak var picker:UIPickerView?

  public func update(items:[T]){
    self.items = items
    picker?.reloadComponent(0)
  }

  public func bind(to picker:UIPickerView){
    self.picker = picker
      picker.dataSource = self
      picker.delegate = self
      picker.reloadComponent(0)
  }
  

  // MARK: UIPickerViewDataSource
  // returns the number of 'columns' to display.
  public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    return 1
  }

  // returns the # of rows in each component..
  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    return items.count
  }

  // MARK: UIPickerViewDelegate
  // returns width of column and height of row for each component.
//  @available(iOS 2.0, *)
//  optional public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat

  public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
    return rowHeight
  }


  // these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
  // for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
  // If you return back a different object, the old one will be released. the view will be centered in the row rect
//  public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
//  }


//  @available(iOS 6.0, *)
  // attributed title is favored if both methods are implemented
  public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString?{
    let item = items[row]
    let attrStr = NSAttributedString(string: item.title, attributes: [
      NSForegroundColorAttributeName:textColor,
      NSFontAttributeName:font
      ])
    return attrStr
  }
//
//  @available(iOS 2.0, *)
//  optional public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView


  public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
    let item = items[row]
    didSelectItem?(item)
  }

}
