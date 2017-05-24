#!/usr/bin/env python
# -*- coding: utf-8 -*-
from string import Template
import os
import codecs

SRC_DIR = "CAEmitterLayerDemo"

def camelize(name):
    return name[0].upper() + name[1:]


def base_ctrl():
    position_props = ['x','y', 'z']
    size_props = ['width', 'height', 'depth']
    all_props = position_props + size_props

    stats = []
    stats.append("""
    import UIKit
    class EmitterLayerViewController: UIViewController{
                 """)

    stats.append("""
      override func onEmitterLayerSetup(layer:CAEmitterLayer){
      """)

    init_tpl = Template("""
    ${var}Slider.value = Float(layer.${var})
    ${var}TextField.text = layer.${var}.description
        """)
    for var_name in  all_props :
        init_stat = init_tpl.substitute(var=var_name)
        stats.append(init_stat)
    stats.append("""
      }
    """)

    for var_name in  all_props:
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

    with codecs.open(os.path.join(SRC_DIR,'EmitterLayerViewController.swift'),mode='w', encoding='utf-8') as fout:
        fout.write("\n".join(stats))
        # for stat in stats:
            # fout.write(stat+"\n")

if __name__ == '__main__':
    base_ctrl()


