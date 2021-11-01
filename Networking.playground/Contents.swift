import UIKit
import PlaygroundSupport

// MARK: MyViewController class
final class MyViewController : UIViewController {
  // MARK: - Properties
  private weak var imageView: UIImageView!
  
  // MARK: - Lifecycle methods
  override func loadView() {
    let view: UIView = UIView()
    view.backgroundColor = .white
    
    let imageView: UIImageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)
    self.imageView = imageView
    
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    let image: UIImage? = UIImage(named: "swift.jpg")
    self.imageView.image = image
  }
}

// Present the view controller in the Live View window
let view: MyViewController = MyViewController()
PlaygroundPage.current.liveView = view
