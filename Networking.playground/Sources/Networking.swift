import UIKit

// MARK: - Network class
public final class Network {
  // MARK: - Properties
  private let imageURL: String = "https://goo.gl/wV9G4I"
  
  // MARK: - Public initializer
  public init() {}
  
  // MARK: - Public methods
  public func getImage(_ completion: @escaping (UIImage?) -> ()) {
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
      
      // Send image into completion
      completion(image)
    }
    
    dataTask.resume()
  }
}