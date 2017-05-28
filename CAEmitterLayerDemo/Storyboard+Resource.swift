// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> CAEmitterLayerDemo.MainViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CAEmitterLayerDemo.MainViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case behaviorCtrlScene = "behaviorCtrl"
    static func instantiateBehaviorCtrl() -> CAEmitterLayerDemo.BehaviorCtrlViewController {
      guard let vc = StoryboardScene.Main.behaviorCtrlScene.viewController() as? CAEmitterLayerDemo.BehaviorCtrlViewController
      else {
        fatalError("ViewController 'behaviorCtrl' is not of the expected class CAEmitterLayerDemo.BehaviorCtrlViewController.")
      }
      return vc
    }

    case colorCtrlScene = "colorCtrl"
    static func instantiateColorCtrl() -> CAEmitterLayerDemo.ColorCtrlViewController {
      guard let vc = StoryboardScene.Main.colorCtrlScene.viewController() as? CAEmitterLayerDemo.ColorCtrlViewController
      else {
        fatalError("ViewController 'colorCtrl' is not of the expected class CAEmitterLayerDemo.ColorCtrlViewController.")
      }
      return vc
    }

    case contentCtrlScene = "contentCtrl"
    static func instantiateContentCtrl() -> CAEmitterLayerDemo.ContentCtrlViewController {
      guard let vc = StoryboardScene.Main.contentCtrlScene.viewController() as? CAEmitterLayerDemo.ContentCtrlViewController
      else {
        fatalError("ViewController 'contentCtrl' is not of the expected class CAEmitterLayerDemo.ContentCtrlViewController.")
      }
      return vc
    }

    case emitterLayerCtrlScene = "emitterLayerCtrl"
    static func instantiateEmitterLayerCtrl() -> CAEmitterLayerDemo.EmitterLayerViewController {
      guard let vc = StoryboardScene.Main.emitterLayerCtrlScene.viewController() as? CAEmitterLayerDemo.EmitterLayerViewController
      else {
        fatalError("ViewController 'emitterLayerCtrl' is not of the expected class CAEmitterLayerDemo.EmitterLayerViewController.")
      }
      return vc
    }

    case motionAndTemporalCtrlScene = "motionAndTemporalCtrl"
    static func instantiateMotionAndTemporalCtrl() -> CAEmitterLayerDemo.MotionAndTemporalCtrlViewController {
      guard let vc = StoryboardScene.Main.motionAndTemporalCtrlScene.viewController() as? CAEmitterLayerDemo.MotionAndTemporalCtrlViewController
      else {
        fatalError("ViewController 'motionAndTemporalCtrl' is not of the expected class CAEmitterLayerDemo.MotionAndTemporalCtrlViewController.")
      }
      return vc
    }

    case scaleAndFilterCtrlScene = "scaleAndFilterCtrl"
    static func instantiateScaleAndFilterCtrl() -> CAEmitterLayerDemo.ScaleAndFilterCtrlViewController {
      guard let vc = StoryboardScene.Main.scaleAndFilterCtrlScene.viewController() as? CAEmitterLayerDemo.ScaleAndFilterCtrlViewController
      else {
        fatalError("ViewController 'scaleAndFilterCtrl' is not of the expected class CAEmitterLayerDemo.ScaleAndFilterCtrlViewController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}

