// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

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

    static func initialViewController() -> CAEmitterLayerDemo.ViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? CAEmitterLayerDemo.ViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
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

    case scaleCtrlScene = "scaleCtrl"
    static func instantiateScaleCtrl() -> UIViewController {
      return StoryboardScene.Main.scaleCtrlScene.viewController()
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}

