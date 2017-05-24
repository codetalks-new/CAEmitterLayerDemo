//
//  BasePickerViewController.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 24/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit

class BasePickerViewController: UIViewController {
    let cancelButton = UIButton(type: .system)
    let titleLabel = UILabel(frame: .zero)
    let doneButton = UIButton(type: .system)

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    transitioningDelegate = self
    modalPresentationStyle = .custom
    modalTransitionStyle = .coverVertical
    let width = UIScreen.main.bounds.width
    preferredContentSize = CGSize(width:width , height: 248)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open var pickerView:UIView{
    fatalError("Should override this get")
  }

  override func loadView() {
    super.loadView()
    view.backgroundColor = UIColor(white: 0.912, alpha: 1.0)


    for button in [cancelButton, doneButton]{
      view.addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      let c = button.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0)
      view.addConstraint(c)
    }

    view.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

     let tc1 = titleLabel.centerYAnchor.constraint(equalTo: doneButton.centerYAnchor)
    view.addConstraint(tc1)
    let tc2 = titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    view.addConstraint(tc2)
    
    view.addSubview(pickerView)
    pickerView.translatesAutoresizingMaskIntoConstraints = false
    pickerView.backgroundColor = .white

    let c1 = cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
    view.addConstraint(c1)

    let c2 = doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
    view.addConstraint(c2)

    cancelButton.setTitle("取消", for: .normal)
    doneButton.setTitle("完成", for: .normal)

    let cp1 = pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
    let cp2 = pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
    let cp3 = pickerView.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 4)
    let cp4 = pickerView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
    view.addConstraints([cp1,cp2,cp3,cp4])
    

    cancelButton.addTarget(self, action: #selector(onCancelButtonPressed), for: .touchUpInside)
    doneButton.addTarget(self, action: #selector(onDoneButtonPressed), for: .touchUpInside)
    
  }

  func onCancelButtonPressed(){
      dismiss(animated: true, completion: nil)
  }
  
  func onDoneButtonPressed(){
    dismiss(animated: true, completion: nil)
  }

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

// MARK: UIViewControllerTransitioningDelegate
extension BasePickerViewController:UIViewControllerTransitioningDelegate {
  public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentation = ActionSheetPresentationController(presentedViewController: presented, presenting: presenting)
    return presentation
  }
}
