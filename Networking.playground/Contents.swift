import UIKit
import PlaygroundSupport

// MARK: MyViewController class
final class MyViewController : UIViewController {
  // MARK: - Lifecycle methods
  override func loadView() {
    let view: UIView = UIView()
    view.backgroundColor = .white
    
    let label: UILabel = UILabel()
    label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
    label.text = "Hello World!"
    label.textColor = .black
    
    view.addSubview(label)
    self.view = view
  }
}

// Present the view controller in the Live View window
let view: MyViewController = MyViewController()
PlaygroundPage.current.liveView = view
