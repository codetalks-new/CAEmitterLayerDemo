//
//  BehaviorCtrlViewController.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 25/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit

class BehaviorCtrlViewController: UITableViewController {

  @IBOutlet weak var waveCell: EmitterBehaviorTableViewCell!
  var emitter:CAEmitterLayer?


  lazy var waveBehavior: CAEmitterBehavior = {
    let wave = CAEmitterBehavior(type: kCAEmitterBehaviorWave)
    wave.name = "wave"
    wave.isEnabled = true
    wave.setValue([150,0,0], forKeyPath: "force")
    wave.setValue(17, forKeyPath: "frequency")
    return wave
  }()

  var allBehaviors:[CAEmitterBehavior]{
    return [waveBehavior]
  }

  var allEnabledBehaviors:[CAEmitterBehavior]{
    return allBehaviors.filter{ $0.isEnabled }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      if let emitter = self.emitter{
          setupEmitter(emitter)
      }else{
        NSLog("no emitter")
      }
    }

  func setupEmitter(_ emitter:CAEmitterLayer){
    waveCell.switchView?.isOn = waveBehavior.isEnabled
    emitter.setValue(allEnabledBehaviors, forKeyPath: "emitterBehaviors")
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func onBehaviorsStateChanged(){
  }

  @IBAction func onWaveStateChanged(_ sender:UISwitch) {
    emitter?.setValue(sender.isOn, forKeyPath: "emitterBehaviors.wave.enabled")
  }

  @IBAction func onEditWaveButtonPressed() {
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
