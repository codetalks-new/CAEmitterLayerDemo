#!/usr/bin/env python
# -*- coding: utf-8 -*-
from string import Template
import os
import codecs

SRC_DIR = "CAEmitterLayerDemo"

def camelize(name):
    return name[0].upper() + name[1:]


def color_ctrl():
    speed_props = ['redSpeed','greenSpeed','blueSpeed','alphaSpeed']
    range_props = ['redRange','greenRange','blueRange','alphaRange']

    stats = []
    stats.append("""
    import UIKit
    class ColorCtrlViewController: BaseCtrlViewController{
                 """)

    stats.append("""
      override func onEmitterCellChanged(newCell:CAEmitterCell){
      """)

    init_tpl = Template("""
    ${var}Slider.value = newCell.${var}
    ${var}TextField.text = newCell.${var}.description
        """)
    for var_name in  range_props + speed_props :
        init_stat = init_tpl.substitute(var=var_name)
        stats.append(init_stat)
    stats.append("""
      }
    """)

    for var_name in  range_props + speed_props :
        decl_stat = "@IBOutlet weak var %sSlider: UISlider!" % var_name
        stats.append(decl_stat)
        decl_stat = "@IBOutlet weak var %sTextField: UITextField!" % var_name
        stats.append(decl_stat)

        event_func_tpl = Template("""
    @IBAction func on${var_u}Changed(_ sender: Any) {
        let newValue = ${var}Slider.value
                                emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).${var}")
        ${var}TextField.text = newValue.description
    }

    @IBAction func on${var_u}EditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    emitter?.setValue(newValue,forKeyPath:"emitterCells.\(emitterCellName).${var}")
    ${var}Slider.setValue(newValue, animated: true)

  }


        """)
        event_func = event_func_tpl.substitute(dict(
            var=var_name,
            var_u=camelize(var_name)
        ))
        stats.append(event_func)

    stats.append("\n}")

    with codecs.open(os.path.join(SRC_DIR,'ColorCtrl.swift'),mode='w', encoding='utf-8') as fout:
        fout.write("\n".join(stats))
        # for stat in stats:
            # fout.write(stat+"\n")

if __name__ == '__main__':
    color_ctrl()


