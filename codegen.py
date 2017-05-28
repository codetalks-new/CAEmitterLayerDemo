#!/usr/bin/env python
# -*- coding: utf-8 -*-
from string import Template
import os
import codecs

SRC_DIR = "CAEmitterLayerDemo"

def camelize(name):
    return name[0].upper() + name[1:]


def base_ctrl():
    contents_props = ['x', 'y', 'width','height']
    all_props = contents_props

    stats = []
    stats.append("""
    import UIKit
    class BehaviorCtrlViewController: UITableViewController{
                 """)


    for var_name in  all_props:
        cell_stat = "@IBOutlet weak var %sSlider: UISlider!" % var_name
        stats.append(cell_stat)
        decl_stat = "@IBOutlet weak var %sTextField: UITextField!" % var_name
        stats.append(decl_stat)

        event_func_tpl = Template("""
    @IBAction func on${var_u}Changed(_ sender: UISlider) {
        let newValue = ${var}Slider.value
        ${var}TextField.text = newValue.description
        onContentsRectChanged()
    }

    @IBAction func on${var_u}EditingDidEnd(_ sender: UITextField) {
    guard let newValue = Float(sender.text ?? "0") else {
      return
    }
    ${var}Slider.setValue(newValue, animated: true)
    onContentsRectChanged()

  }


        """)
        event_func = event_func_tpl.substitute(dict(
            var=var_name,
            var_u=camelize(var_name)
        ))
        stats.append(event_func)

    stats.append("\n}")

    # with codecs.open(os.path.join(SRC_DIR,'BehaviorCtrlViewController.swift'),mode='w', encoding='utf-8') as fout:
    #     fout.write("\n".join(stats))
    for stat in stats:
        print(stat+"\n")

if __name__ == '__main__':
    base_ctrl()


