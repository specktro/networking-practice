import UIKit

// MARK: MyViewController class
final public class MyViewController: UIViewController {
  // MARK: - Properties
  private weak var imageView: UIImageView!
  
  // MARK: - Lifecycle methods
  override public func loadView() {
    let view: UIView = UIView()
    view.backgroundColor = .white
    
    let imageView: UIImageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)
    self.imageView = imageView
    
    self.view = view
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    // Create the worker and request the image into the main thread
    let networker: Network = Network()
    networker.getImage { image in
      DispatchQueue.main.async { [weak self] in
        self?.imageView.image = image
      }
    }
  }
}

