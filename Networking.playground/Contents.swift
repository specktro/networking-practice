import UIKit
import PlaygroundSupport
import Foundation

class Network {
  private let imageURL: String = "https://goo.gl/wV9G4I"
  
  func getImage(_ completion: @escaping () -> ()) {
    // Try to get a valid url from image url string
    guard let url: URL = URL(string: imageURL) else {
      preconditionFailure("Thre was a problem getting the url from string")
    }
    
    // A simple session with default configuration
    let session: URLSession = URLSession(configuration: .default)
    // A request with the simple url string
    let request: URLRequest = URLRequest(url: url)
    // Another important object in this process to get the resource from the request, this in raw data
    let dataTask: URLSessionDataTask = session.dataTask(with: request) { data, response, error in
      // If there is an error with the request this would be sent a preconditionFailure
      if error != nil {
        preconditionFailure("Thre was a problem getting the data from url: \(error!.localizedDescription)")
      }
      
      // If there is not data this would be sent a preconditionFailure
      guard let data = data else {
        preconditionFailure("It was not possible to get data")
      }
      
      // Transform the date into an image
      let image: UIImage? = UIImage(data: data)
      
      // If you are going to update the user interface it must be done into the main thread
//      DispatchQueue.main.sync { [weak self] in
//        self?.imageView.image = image
//      }
    }
    
    dataTask.resume()
  }
}

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
  }
}

// Present the view controller in the Live View window
let view: MyViewController = MyViewController()
PlaygroundPage.current.liveView = view
