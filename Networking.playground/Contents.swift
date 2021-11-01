import UIKit
import PlaygroundSupport
import Foundation

// MARK: MyViewController class
final class MyViewController : UIViewController {
  // MARK: - Properties
  private let imageURL: String = "https://goo.gl/wV9G4I"
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
    
    // Try to get a valid url from image url string
    guard let url: URL = URL(string: imageURL) else {
      preconditionFailure("Thre was a problem getting the url from string")
    }
    
    // Send an asynchronous block into a default background queue to make the dirty work
    DispatchQueue.global(qos: .default).async {
      // Try to get data from the url
      guard let data: Data = try? Data(contentsOf: url) else {
        preconditionFailure("Thre was a problem getting the data from url")
      }
      
      // Transform the date into an image
      let image: UIImage? = UIImage(data: data)
      
      // If you are going to update the user interface it must be done into the main thread
      DispatchQueue.main.sync { [weak self] in
        self?.imageView.image = image
      }
    }
  }
}

// Present the view controller in the Live View window
let view: MyViewController = MyViewController()
PlaygroundPage.current.liveView = view
